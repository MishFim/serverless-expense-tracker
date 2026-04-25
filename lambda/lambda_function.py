import json
import boto3
import uuid
import os

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])

def lambda_handler(event, context):
    method = event["requestContext"]["http"]["method"]

    if method == "POST":
        data = json.loads(event["body"])
        expense_id = str(uuid.uuid4())
        table.put_item(Item={"expense_id": expense_id, **data})
        return {"statusCode": 201, "body": json.dumps({"id": expense_id})}

    return {"statusCode": 200, "body": json.dumps({"message": "ok"})}
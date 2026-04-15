const API_URL = "YOUR_API_URL/expense";

const form = document.getElementById("expenseForm");
const message = document.getElementById("message");

form.addEventListener("submit", async (e) => {
  e.preventDefault();

  const payload = {
    amount: Number(document.getElementById("amount").value),
    category: document.getElementById("category").value,
    date: document.getElementById("date").value,
  };

  try {
    const response = await fetch(API_URL, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    });

    const data = await response.json();
    message.textContent = `✅ Expense created with ID: ${data.id}`;
    form.reset();
  } catch (error) {
    message.textContent = "❌ Failed to save expense";
  }
});
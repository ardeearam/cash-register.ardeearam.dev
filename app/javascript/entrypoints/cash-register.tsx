// app/javascript/entrypoints/application.tsx
import React from "react"
import ReactDOM from "react-dom/client"

// Example: import your main App component
import App from "../components/App"



document.addEventListener("DOMContentLoaded", () => {
  const rootElement = document.getElementById("root");
  const basketId = rootElement?.dataset.basketId;
  const csrfToken = document.querySelector('meta[name=csrf-token')?.getAttribute('content');

  if (rootElement) {
    const root = ReactDOM.createRoot(rootElement)
    root.render(<App csrfToken={csrfToken} basketId={basketId} />)
  }
})

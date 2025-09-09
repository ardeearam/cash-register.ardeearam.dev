// app/javascript/entrypoints/application.tsx
import React from "react"
import ReactDOM from "react-dom/client"

// Example: import your main App component
import App from "../components/App"



document.addEventListener("DOMContentLoaded", () => {
  const rootElement = document.getElementById("root");

  if (rootElement) {
    const root = ReactDOM.createRoot(rootElement)
    root.render(<App />)
  }
})

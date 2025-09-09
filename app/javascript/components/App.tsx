import React from "react"

export default function App() {
  return (
    <div className="mx-auto w-3/4">
      <h1 className="block text-2xl">Cash Register</h1>
      <div className="h-50 border-blue-400 border-1 rounded-md w-full"></div>
      <div className="h-20 rounded-md w-full text-3xl"> = €0</div>
      <div>
        <button className="bg-blue-400 text-white cursor-pointer p-3 m-2 rounded-full">GR1 - Green Tea</button>
        <button className="bg-blue-400 text-white cursor-pointer p-3 m-2 rounded-full">SR1 - Strawberries</button>
        <button className="bg-blue-400 text-white cursor-pointer p-3 m-2 rounded-full">CF1 - Coffee</button>
      </div>
    </div>   
  )
}

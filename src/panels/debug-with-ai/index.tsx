import { createRoot } from "react-dom/client"

import "@/globals.css"

const DebugWithAi = () => {
  return (
    <div className="bg-gray-400">
      <h2 className="text-red-500">おはようございます</h2>
      <p>HELLO WORLD</p>
    </div>
  )
}

const root = createRoot(document.getElementById("root"))
root.render(<DebugWithAi />)

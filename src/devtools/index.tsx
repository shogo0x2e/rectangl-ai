import debugWithAiHTML from "url:../panels/debug-with-ai/index.html"

import "@/globals.css"

chrome.devtools.panels.create(
  "Debug with AI",
  null,
  // See: https://github.com/PlasmoHQ/plasmo/issues/106#issuecomment-1188539625
  debugWithAiHTML.split("/").pop()
)

function IndexDevtools() {
  return (
    <h2>
      Welcome to your <a href="https://www.plasmo.com">Plasmo</a> Extension!
    </h2>
  )
}

export default IndexDevtools

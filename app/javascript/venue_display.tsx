import * as React from "react"
import * as ReactDOM from "react-dom"
import Venue from "./components/venue"

document.addEventListener("turbo:load", () => {
  if (document.getElementById("react-element")) {
    ReactDOM.render(
      <Venue rows={10} seatsPerRow={10} />,
      document.getElementById("react-element")
    )
  }
})
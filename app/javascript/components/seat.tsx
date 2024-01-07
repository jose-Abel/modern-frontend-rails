import * as React from "react"

interface SeatProps {
  seatNumber: number
  status: string
  clickHandler: (seatNumber: number) => void
}

export const Seat = ({
  seatNumber,
  status,
  clickHandler,
}: SeatProps): React.ReactElement => {
  function stateDisplayClass(): string {
    if (status === "unsold") {
      return "bg-white hover:bg-blue-300"
    } else if (status === "held") {
      return "bg-green-500"
    } else {
      return "bg-red-500"
    }
  }

  function changeState(): void {
    clickHandler(seatNumber)
  }

  const cssClass = "p-4 m-2 border-black border-4 text-lg"

  return (
    <td>
      <span
        className={`${cssClass} ${stateDisplayClass()}`}
        onClick={changeState}>
        {seatNumber + 1}
      </span>
    </td>
  )
}

export default Seat
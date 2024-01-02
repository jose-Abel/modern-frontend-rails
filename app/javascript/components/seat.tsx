import * as React from "react"

interface SeatProps {
  seatNumber: number
}

const Seat = (props: SeatProps): React.ReactElement => {
  return (
    <td>
      <span
        className="p-4 m-2 border-black border-4 button
                   hover:bg-blue-300 text-lg">
        {props.seatNumber + 1}
      </span>
    </td>
  )
}

export default Seat

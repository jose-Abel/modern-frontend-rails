import * as React from "react"
import Seat from "./seat"

interface RowProps {
  rowNumber: number
  seatsPerRow: number
  ticketsToBuyCount: number
}

const Row = (props: RowProps): React.ReactElement => {
  const [seatStatuses, setSeatStatuses] = React.useState(
    Array.from(Array(props.seatsPerRow).keys()).map(() => "unsold")
  )

  function isSeatValid(seatNumber): boolean {
    if (seatNumber + props.ticketsToBuyCount > props.seatsPerRow) {
      return false
    }
    for (let i = 1; i < props.ticketsToBuyCount; i++) {
      if (seatStatuses[seatNumber + i] === "held") {
        return false
      }
    }
    return true
  }

  function validSeatStatus(seatNumber): string {
    if (seatStatuses[seatNumber] === "held") {
      return "held"
    } else {
      return isSeatValid(seatNumber) ? "unsold" : "invalid"
    }
  }

  function newState(oldStatus: string): string {
    if (oldStatus === "unsold") {
      return "held"
    } else if (oldStatus === "held") {
      return "unsold"
    } else {
      return "invalid"
    }
  }

  function onSeatChange(seatNumber: number): void {
    if (validSeatStatus(seatNumber) === "invalid") {
      return
    }
    setSeatStatuses(
      seatStatuses.map((status, index) => {
        if (
          index >= seatNumber &&
          index < seatNumber + props.ticketsToBuyCount
        ) {
          return newState(seatStatuses[seatNumber])
        } else {
          return status
        }
      })
    )
  }

  const seatItems = Array.from(Array(props.seatsPerRow).keys()).map(
    (seatNumber) => {
      return (
        <Seat
          key={seatNumber}
          seatNumber={seatNumber}
          status={validSeatStatus(seatNumber)}
          clickHandler={onSeatChange}
        />
      )
    }
  )

  return <tr className="h-20">{seatItems}</tr>
}

export default Row
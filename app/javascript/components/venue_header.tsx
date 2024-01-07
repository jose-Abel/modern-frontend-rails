import * as React from "react"

interface VenueHeaderProps {
  seatsPerRow: number
  setTicketsToBuyCount: (n: number) => void
}

const options = (seatsPerRow) => {
  const arrayOfNumbers = Array.from(Array(seatsPerRow).keys())
  return arrayOfNumbers.map((i) => (
    <option key={i + 1} value={i + 1}>
      {i + 1}
    </option>
  ))
}

export const VenueHeader = ({
  seatsPerRow,
  setTicketsToBuyCount,
}: VenueHeaderProps): React.ReactElement => {
  const setTicketsOnChange = (event: React.SyntheticEvent): void => {
    const target = event.target as HTMLSelectElement
    setTicketsToBuyCount(parseInt(target.value, 10))
  }

  return (
    <div>
      <span>How many tickets would you like?</span>
      <span className="select">
        <select onChange={setTicketsOnChange}>
          {options(seatsPerRow)}
        </select>
      </span>
    </div>
  )
}

export default VenueHeader
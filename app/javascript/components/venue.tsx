import * as React from "react"
import VenueBody from "./venue_body"
import VenueHeader from "./venue_header"

interface VenueProps {
  rows: number
  seatsPerRow: number
}

const Venue = ({ rows, seatsPerRow }: VenueProps): React.ReactElement => {
  const [ticketsToBuyCount, setTicketsToBuyCount] = React.useState(1)

  return (
    <>
      <VenueHeader
        seatsPerRow={seatsPerRow}
        setTicketsToBuyCount={setTicketsToBuyCount}
      />
      <VenueBody
        seatsPerRow={seatsPerRow}
        rows={rows}
        ticketsToBuyCount={ticketsToBuyCount}
      />
    </>
  )
}

export default Venue

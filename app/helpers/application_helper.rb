#---
# Excerpted from "Modern Front-End Development for Rails, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/nrclient2 for more book information.
#---
module ApplicationHelper
  def color_for(ticket, user)
    case ticket.status
    when "unsold" then "bg-white"
    when "held"
      ticket.user == user ? "bg-red-600" : "bg-yellow-500"
    when "purchased"
      ticket.user == user ? "bg-green-600" : "bg-yellow-500"
    end
  end
end

#---
# Excerpted from "Modern Front-End Development for Rails, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/nrclient2 for more book information.
#---
class ScheduleDay
  include ActiveModel::Model
  attr_accessor :day, :concerts, :hidden

  def initialize(day, concerts, hidden = false)
    @day = day
    @concerts = concerts
    @hidden = hidden
  end

  def day_string
    day.by_example("2006-01-02")
  end

  def day_of?(string)
    return false unless string
    day == Date.parse(string)
  end

  def hide!
    @hidden = true
  end

  def toggle!
    @hidden = !@hidden
  end
end

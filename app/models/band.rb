#---
# Excerpted from "Modern Front-End Development for Rails, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/nrclient2 for more book information.
#---
# == Schema Information
#
# Table name: bands
#
#  id          :bigint           not null, primary key
#  description :text
#  genre_tags  :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Band < ApplicationRecord
  def genres
    genre_tags.split(",")
  end
end

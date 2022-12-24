#---
# Excerpted from "Modern Front-End Development for Rails, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/nrclient2 for more book information.
#---
class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.text :genre_tags

      t.timestamps
    end
  end
end

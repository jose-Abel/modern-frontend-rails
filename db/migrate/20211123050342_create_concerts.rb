#---
# Excerpted from "Modern Front-End Development for Rails, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/nrclient2 for more book information.
#---
class CreateConcerts < ActiveRecord::Migration[7.0]
  def change
    create_enum :enum_ilk, %w[concert meet_n_greet battle]
    create_enum :enum_access, %w[general members vips]

    # TODO: actually fix the enum issue
    create_table :concerts do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.references :venue, null: false, foreign_key: true
      t.text :genre_tags
      t.string :ilk, enum_name: :enum_ilk
      t.string :access, enum_name: :enum_access

      t.timestamps
    end
  end
end

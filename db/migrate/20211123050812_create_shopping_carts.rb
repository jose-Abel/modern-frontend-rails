#---
# Excerpted from "Modern Front-End Development for Rails, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/nrclient2 for more book information.
#---
class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    change_table :tickets do |t|
      t.references :shopping_carts, null: true, foreign_key: true
    end

    change_table :ticket_orders do |t|
      t.references :shopping_carts, null: true, foreign_key: true
    end
  end
end

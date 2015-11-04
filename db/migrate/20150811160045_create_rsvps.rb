class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :name
      t.boolean :attending
      t.string :food
      t.string :drink
      t.string :sauna
      t.string :wishlist
      t.string :stars
      t.string :coke
      t.string :sheriff

      t.timestamps null: false
    end
  end
end

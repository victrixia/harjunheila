class AddOtherToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :other, :string
  end
end

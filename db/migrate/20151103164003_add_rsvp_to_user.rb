class AddRsvpToUser < ActiveRecord::Migration
  def change
    add_column :rsvps, :user_id, :integer
    add_column :users, :rsvp_id, :integer
  end
end

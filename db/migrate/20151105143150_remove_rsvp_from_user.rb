class RemoveRsvpFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :rsvp_id, :integer
  end
end

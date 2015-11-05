class Rsvp < ActiveRecord::Base
  belongs_to :user, inverse_of: :rsvp
end

class User < ActiveRecord::Base
  has_secure_password
  has_one :rsvp, inverse_of: :user
end

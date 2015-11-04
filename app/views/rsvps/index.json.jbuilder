json.array!(@rsvps) do |rsvp|
  json.extract! rsvp, :id, :name, :attending, :food, :drink, :sauna, :wishlist, :stars, :coke, :sheriff
  json.url rsvp_url(rsvp, format: :json)
end

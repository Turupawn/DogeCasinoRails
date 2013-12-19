json.array!(@users) do |user|
  json.extract! user, :id, :name, :pass, :address, :deposit_address
  json.url user_url(user, format: :json)
end

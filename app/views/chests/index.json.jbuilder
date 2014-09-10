json.array!(@chests) do |chest|
  json.extract! chest, :id, :user_id, :price, :prize
  json.url chest_url(chest, format: :json)
end

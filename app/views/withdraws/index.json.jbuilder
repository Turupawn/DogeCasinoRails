json.array!(@withdraws) do |withdraw|
  json.extract! withdraw, :id, :user_id, :amount
  json.url withdraw_url(withdraw, format: :json)
end

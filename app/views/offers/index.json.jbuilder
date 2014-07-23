json.array!(@offers) do |offer|
  json.extract! offer, :id, :name, :description, :created_at, :quantity, :cost, :active
  json.url offer_url(offer, format: :json)
end

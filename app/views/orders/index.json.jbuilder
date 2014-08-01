json.array!(@orders) do |order|
  json.extract! @order, :id, :received_at, :quantity, :firstname, :lastname, :telephone, :email, :street, :zip, :city, :comment, :finished, :offer
  json.url order_url(order, format: :json)
end

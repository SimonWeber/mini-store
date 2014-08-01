json.array!(@orders) do |order|
  json.extract! @order, :id, :date, :quantity, :firstname, :lastname, :telephone, :email, :street, :zip, :city, :comment, :finished, :offer
  json.url order_url(order, format: :json)
end

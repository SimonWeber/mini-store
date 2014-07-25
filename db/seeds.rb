# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when "development"
   User.create!(email: "user@example.com", password: "password")

   offer = Offer.create!(name: "VW Polo 6N", description: "Auto aus dem Jahre 1998", created_at: Time.now, quantity: 1, cost: 2999.95, active: true)

   Order.create!(date: Time.now, quantity: 2, firstname: "Mister", lastname: "Pancho", email: "mr.pancho@panchos.com", street: "panchostreet 12", zip: 30419, city: "panchocity", comment: "Por favor consigueme este producto y aviseme por telefono si ya esta", finished: false, offer: offer)

when "production"

end
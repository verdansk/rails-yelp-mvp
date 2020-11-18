require 'faker'

10.times do
  restaurant = Restaurant.new(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    phone_number: Faker::Company.duns_number,
    category: 'italian'
  )
  restaurant.save
end

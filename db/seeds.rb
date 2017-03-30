

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Beer.all.delete_all


def getW1Price
  rand(15..40) * 5
end

def getEHPrice
  rand(15..30) * 5
end

Client.delete_all
Price.delete_all

Beer.create!(name: 'Beer 1', abv: 4.5)
Beer.create!(name: 'Beer 2', abv: 5)

User.create!(name: 'Alex', email: 'alex@thegreat.ca', password: '123')
User.create!(name: 'Roger', email: 'roger@devops.ca', password: '123')


x=0
while(x<50) do
  c = Client.create!(name: Faker::Name.name,
    address: Faker::Address.street_address,
    postcode: Faker::Address.postcode,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email
  )

  Price.create!(client_id: c.id,
    w1: getW1Price,
    eh: getEHPrice
  )


  x+=1
end

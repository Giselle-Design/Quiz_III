# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bid.delete_all
Auction.delete_all
User.delete_all


NUM_AUCTIONS= 20
NUM_USERS = 10
PASSWORD = 'supersecret'

super_user = User.create(
    first_name: "John",
    last_name: "Snow",
    email: "js@winterfell.gov",
    password: PASSWORD,
)

NUM_USERS.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
        password: PASSWORD
    )
end

users = User.all



NUM_AUCTIONS.times do
  created_at = Faker::Date.backward(days: 365)
  a=Auction.create(
        title: "#{Faker::Cannabis.strain}-#{rand(100)}",
        description: Faker::Cannabis.health_benefit,
        price: rand(100_000),
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
 )
 if a.valid?
   a.bids = rand(0..20).times.map do
     Bid.new(
      price: rand(10000),
      user: users.sample
     )
   end
 end

end

auction = Auction.all
bid = Bid.all


puts Cowsay.say("Generated #{auction.count} Auction", :turkey)
puts Cowsay.say("Generated #{bid.count} Bids", :frogs)
puts "Login with #{super_user.email} and password: #{PASSWORD}"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.
User.create!(name: "Christian Wirth",
        email: "wirthi@gmx.at",
        password: "clancy26",
        password_confirmation: "clancy26",
        admin: true,
        activated: true,
        activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
          email: email,
          password: password,
          password_confirmation: password,
          activated: true,
          activated_at: Time.zone.now)
end

# Generate Contributions for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.contributions.create!(content: content) }
end

Group.create!(name: "Landesverband Oberösterreich",
  lat: "1234",
  lon: "4567")
Group.create!(name: "Langholzfeld",
  lat: "1234",
  lon: "4567")
Group.create!(name: "Leonding",
  lat: "1234",
  lon: "4567")

Category.create!(title: "Abfall",
  unit: "Kilogramm",
  unit_short: "kg")
Category.create!(title: "Energie",
  unit: "Kilowattstunden",
  unit_short: "kWh")
Category.create!(title: "Ernährung",
  unit: "Kilogramm Kohlendioxid",
  unit_short: "kg CO2")
Category.create!(title: "Verkehr",
  unit: "Kilometer",
  unit_short: "km")
Category.create!(title: "Wasser",
  unit: "Liter",
  unit_short: "l")
  
  
      
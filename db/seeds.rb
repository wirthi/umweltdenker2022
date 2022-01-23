# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

group_lvooe = Group.create!(name: "Landesverband Oberösterreich",
  lat: "1234",
  lon: "4567")
group_lhf = Group.create!(name: "Langholzfeld",
  lat: "1234",
  lon: "4567")
Group.create!(name: "Leonding",
  lat: "1234",
  lon: "4567")

# Create a main sample user.
User.create!(firstname: "Christian",
        name: "Wirth",
        email: "wirthi@gmx.at",
        password: "clancy26",
        password_confirmation: "clancy26",
        admin: true,
        activated: true,
        activated_at: Time.zone.now,
        group_id: group_lvooe.id)

15.times do |n|
  firstname = Faker::Name.first_name
  name = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
          firstname: firstname,
          email: email,
          password: password,
          password_confirmation: password,
          activated: true,
          activated_at: Time.zone.now,
          group_id: group_lhf.id)
end

abfall = Category.create!(title: "Abfall",
  unit: "Kilogramm",
  unit_short: "kg",
  title_en: "waste")
energie = Category.create!(title: "Energie",
  unit: "Kilowattstunden",
  unit_short: "kWh",
  title_en: "energy")
ernaehrung = Category.create!(title: "Ernährung",
  unit: "Kilogramm Kohlendioxid",
  unit_short: "kg CO2",
  title_en: "food")
verkehr = Category.create!(title: "Verkehr",
  unit: "Kilometer",
  unit_short: "km",
  title_en: "traffic")
wasser = Category.create!(title: "Wasser",
  unit: "Liter",
  unit_short: "l",
  title_en: "water")

# Generate Contributions for a subset of users.
users = User.order(:created_at).take(6)
15.times do
  content = Faker::Lorem.sentence(word_count: 5)
  title = Faker::Lorem.sentence(word_count: 2)
  users.each { |user| user.contributions.create!(
    title: title,
    content: content,
    category: abfall,
    amount: 42,
    completion: "31.12.2022") }
end

# Generate Challenges
Challenge.create(title: "Eine-Woche-kein-Auto-Challenge",
  description: "Versuche mal, eine Woche ohne Auto auszukommen. Geht leicht, ich bin ja noch zu jung und darf gar nicht Auto fahren… Dann verzichte aufs gefahren werden und geh zu Fuß oder nimm das Fahrrad: Auf dem Weg zur Schule, Zum Sport, zum Heimabend etc.",
  submission: "Gib an, wieviele Kilometer Autofahrt du eingespart hast.",
  category: verkehr)

Challenge.create(title: "Schweinefleisch-Challenge",
  description: "Iss nur 2 mal pro Woche Schweinefleisch. Das spart über 4 kg CO=2 pro Woche ein",
  submission: "4 kg CO2, wenn du es schaffst",
  category: ernaehrung)
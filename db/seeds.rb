# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts 'Destroying bookings, users and inflatables'
Booking.destroy_all
Inflatable.destroy_all
User.destroy_all # if Rails.env.development

inflatables_category_list = ['Air dancer', 'Air mattress' 'laser maze', 'climbing wall', 'Exercise ball', 'airscreen', 'Inflatable boat', 'Inflatable castle', 'Inflatable pool', 'Sex doll', 'Water ball', 'Zeppelin']

inflatables_condition_list = ['weather-beaten', 'acceptable', 'marvelous', 'satisfying', 'worthless', 'solid', 'stela', 'orgasmic', 'filthy', 'outrageous']

test_user = User.create!(
    email: "infl@table.com",
    password: "123456",
    first_name: "Uni",
    last_name: "Corn",
    username: "inflatable",
    description: Faker::Hipster.paragraph(sentence_count: 2)
  )

results = Cloudinary::Search.execute["resources"]
url_array = results.map { |result| result["url"]}


5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Hipster.word,
    description: Faker::Hipster.paragraph(sentence_count: 2)
  )

  rand(0..5).times do
    file = URI.open(url_array.sample)

      inflatable = Inflatable.new(
      name: Faker::Name.first_name,
      category: inflatables_category_list[rand(inflatables_category_list.length)],
      location: Faker::Address.city,
      price: "rand(1..10) #{Faker::CryptoCoin.coin_name}",
      description: Faker::Hipster.paragraph(sentence_count: 2),
      condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
      user_id: user.id
    )

      inflatable.photo.attach(io: file, filename: "#{Faker::Name.first_name}.png" , content_type: 'image/png')
      inflatable.save!
  end
end

puts '5 Users, a Unicorn and some inflatables created'

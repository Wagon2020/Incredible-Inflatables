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
    username: "inflatable1",
    description: Faker::Hipster.paragraph(sentence_count: 2)
  )

test_infi = Inflatable.create!(
    name: "pool fun",
    category: "Inflatable boat",
    location: "Havel",
    price: "19",
    description: "everything you need to enjoy a sunny lake day.",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_300,w_400/87i6kb0kkv4wnko0cdrt42bjpywl')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

test_infi = Inflatable.create!(
    name: "Kayak",
    category: "Inflatable boat",
    location: "Berlin, Kreuzberg",
    price: "30",
    description: "For the sporty people out there",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_500,w_300/wfb4nr374njltk4xtlm3ul9ltlq8')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

test_user1 = User.create!(
    email: "dream@team.com",
    password: "123456",
    first_name: "John",
    last_name: "Hopkins",
    username: "serious",
    description: Faker::Hipster.paragraph(sentence_count: 2)
  )

test_infi = Inflatable.create!(
    name: "Magic Mushroom",
    category: "Air mattresslaser maze",
    location: "Brandenburg",
    price: "299",
    description: "beautiful inflatable mushrooms",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user1.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_300,w_400/ebigct8w34ip3sw03g87jvq0z3fq')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

test_infi = Inflatable.create!(
    name: "Bouncy Bucks Palace",
    category: "Inflatable castle",
    location: "Berlin, friedrichshain",
    price: "300",
    description: "Feel like Queen Elizabeth with this Bouncy Buckingham Palace. ",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user1.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_500,w_300/mskn1rq32rqq76zg3i6f1ulzk036')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

test_user2 = User.create!(
    email: "ailin@team.com",
    password: "123456",
    first_name: "ailin",
    last_name: "Energywatch",
    username: "holiday",
    description: Faker::Hipster.paragraph(sentence_count: 2)
  )

test_infi = Inflatable.create!(
    name: "Flu-mingo with green donut",
    category: "Inflatable boat",
    location: "Stuttgart",
    price: "29",
    description: "like new pink Flamingo. It is just a little bit contaminated with flu viruses.",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user2.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_500,w_300/tli2qv8p656kx2ajjirfgy7es5y1')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

test_infi = Inflatable.create!(
    name: "Ailin's fluffy unicorn",
    category: "Air dancer",
    location: "Honolulu",
    price: "58",
    description: "Super comfy unicorn boat, savley carries you over water. Feels like riding the cloudes",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user2.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_500,w_300/ku6d2df6mskprftlb64ujhk0bsaq')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

test_user3 = User.create!(
    email: "energy@team.com",
    password: "123456",
    first_name: "Captain",
    last_name: "Morgan",
    username: "Pirat",
    description: Faker::Hipster.paragraph(sentence_count: 2)
  )

test_infi = Inflatable.create!(
    name: "They see me rollin' they hatin'",
    category: "Inflatable boat",
    location: "wannsee",
    price: "45",
    description: " Feel like a P.I.M.P in this pimpin' floaty lounge. Snoop Dawgg will join you fo shizzle.",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user3.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_500,w_300/qiop4p1q54ju3983yaioj4yz9dkn')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

test_infi = Inflatable.create!(
    name: "Black Pearl",
    category: "Inflatable boat",
    location: "Martinique",
    price: "30",
    description: "Feel like Captain Jack Sparrow on this marvellous boat. Some say it's a rubber dingy, but I insist that it's a ship.",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user3.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_300,w_400/b98q1d0qpy5ix599zbjihy0cya91')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

test_user4 = User.create!(
    email: "user@team.com",
    password: "123456",
    first_name: "wonder",
    last_name: "full",
    username: "awesome",
    description: Faker::Hipster.paragraph(sentence_count: 2)
  )

test_infi = Inflatable.create!(
    name: "Mr. Donut",
    category: "Inflatable boat",
    location: "Potsdam",
    price: "5",
    description: "For beginners only",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user4.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_500,w_300/bsa8m4x199uq1ddxz5cy41w07r41')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

test_infi = Inflatable.create!(
    name: "Swim Center ",
    category: "Inflatable pool",
    location: "Paris",
    price: "400",
    description: "Awesome luxurious privat spa retreat",
    condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
    user_id: test_user4.id
  )

  file_name = test_infi.name
  file = open('https://res.cloudinary.com/djjqbtq0z/image/upload/c_fill,h_500,w_300/m8mbli4vn42y7ej2fjvf652gsag8')

  test_infi.photo.attach(io: file, filename: file_name , content_type: 'image/png')
  test_infi.save!

# 5.times do
#   user = User.create!(
#     email: Faker::Internet.email,
#     password: "123456",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     username: Faker::Hipster.word,
#     description: Faker::Hipster.paragraph(sentence_count: 2)
#   )

#   rand(0..5).times do
#     Inflatable.create!(
#       name: Faker::Name.first_name,
#       category: inflatables_category_list[rand(inflatables_category_list.length)],
#       location: Faker::Address.city,
#       price: "rand(1..10) #{Faker::CryptoCoin.coin_name}",
#       description: Faker::Hipster.paragraph(sentence_count: 2),
#       condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
#       user_id: user.id
#     )
#   end
# end

puts '4 Users, a Unicorn and some inflatables created'

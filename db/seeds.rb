# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroy User'
User.destroy_all # if Rails.env.development

inflatables_category_list = ['Air dancer', 'Air mattress' 'laser maze', 'climbing wall', 'Exercise ball', 'airscreen', 'Inflatable boat', 'Inflatable castle', 'Inflatable pool', 'Sex doll', 'Water ball', 'Zeppelin']

inflatables_condition_list = ['like new', 'new', 'uesd', 'save', 'aged', 'frail', 'weak', 'shabby', 'run-down', 'old', 'fragile', 'weather-beaten', 'acceptable', 'exellent', 'bad', 'marvelous', 'satisfying', 'superb', 'wonderfull', 'nice', 'pleasing', 'prime', 'sound', 'super', 'worthy', 'dirty', 'admirable', 'OK', 'poor', 'unacceptable', 'worthless', 'inadequate', 'rotten', 'usable', 'wicked', 'all right', 'good enouugh', 'fine', 'adequate', 'good', 'great', 'neat', 'solid', 'clean', 'comfortable']

5.times do
  @user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10, max_length: 20),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Hipster.word,
    description: Faker::Hipster.paragraph(sentence_count: 2)
  )

  rand(0..5).times do
    Inflatable.create!(
      name: Faker::Name.first_name,
      category: inflatables_category_list[rand(inflatables_category_list.length)],
      location: Faker::Address.city,
      price: "rand(1..10) #{Faker::CryptoCoin.coin_name}",
      description: Faker::Hipster.paragraph(sentence_count: 2),
      condition: inflatables_condition_list[rand(inflatables_condition_list.length)],
      user_id: @user.id
    )
  end
end

puts '5 Users and some inflatables created'
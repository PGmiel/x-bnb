# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CategoryActivity.destroy_all
Category.destroy_all
Activity.destroy_all
User.destroy_all

categories = [
Category.create( name: "Water" ),
Category.create( name: "Nature" ),
Category.create( name: "Running" ),
Category.create( name: "Motor" ),
Category.create( name: "Climbing" ),
Category.create( name: "Mountain" ),
Category.create( name: "Cycling" ),
Category.create( name: "City" )
]

5.times do
  @user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123123"
    )
end



20.times do
  @activity = Activity.create(
    name: ["skiing", "kitesuring", "climbing", "via-ferrata", "thriathlon", "bike", "roller-blading", "wakeboarding", "surfing", "skateboarding", "street-luge", "kayaking"].sample,
    description: Faker::Lorem.sentence,
    price: rand(10..95),
    address: "#{Faker::Address.city}, #{Faker::Address.street_address}",
    user: User.all.sample
    )
  @activity.save!
  @activity.categories = categories.sample(3)
  @activity.reviews = 2.times.map do 
    Review.create(
      content: Faker::Lorem.sentence,
      rating: rand(0..5)
    )
  end
end


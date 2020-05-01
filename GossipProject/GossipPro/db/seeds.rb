# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
User.destroy_all
Tag.destroy_all
Gossip.destroy_all
Join.destroy_all
PrivateMessage.destroy_all


10.times do
  	city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
 	user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id, description: Faker::Lorem.words(number: 10), email: Faker::Internet.email, age: rand(5..100))
	tag = Tag.create!(title: Faker::Superhero.power)
	join = Join.create!(gossip_id: Gossip.all.sample.id, tag_id: Tag.all.sample.id)
end

20.times do
  gossip = Gossip.create!(title: Faker::Superhero.prefix, content: Faker::Lorem.words(number: 10), user_id: User.all.sample.id)
end

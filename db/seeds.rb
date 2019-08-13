# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

30.times do
	User.create(first_name: Faker::GreekPhilosophers.name, last_name: Faker::DcComics.hero, username: Faker::Kpop.solo, description: Faker::Quote.famous_last_words, email: "texto@yopmail.com")
end

puts "15 utilisateurs ont été créés !"



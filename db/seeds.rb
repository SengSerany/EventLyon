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


date = DateTime.new(2020,2,3,4,5,6,'+03:00')

10.times do
	Event.create(start_date: date, duration: 60, title: Faker::Games::LeagueOfLegends.quote, price: rand(10..150), location: "Lyon", description: Faker::Lorem.paragraph(sentence_count: 4), admin_id: rand(User.first.id..User.last.id))
end

puts "5 events ont été créés !"

30.times do
	Attendance.create(event_id: rand(Event.first.id..Event.last.id), attendant_id: rand(User.first.id..User.last.id))
end

puts "15 entrée en attendance ont été créés !"

User.destroy_all
Scorecard.destroy_all
Bag.destroy_all
Disc.destroy_all

20.times do 
    User.create(username: Faker::Fantasy::Tolkien.character,
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: 'password')
end

25.times do 
    Scorecard.create(course: Faker::Games::Pokemon.location,
                    date: Faker::Date.between(from: 365.days.ago, to: Date.today),
                    strokes: Faker::Number.between(from: 1, to: 50),
                    score: Faker::Number.between(from: -10, to: 10),
                    user_id: User.ids.sample)
end

puts "seeds planted!!!"
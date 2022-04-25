
require 'csv'

User.destroy_all
Scorecard.destroy_all
Bag.destroy_all
Disc.destroy_all

20.times do 
    User.create(username: Faker::Fantasy::Tolkien.character,
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

# puts "seeds planted!!!"


CSV.foreach(Rails.root.join('lib/seeds/discs.csv'), headers: true) do |row|
    # Disc.create({
    #     brand: row['brand'],
    #     disc_name: row['disc_name'],
    #     speed: row['speed'],
    #     glide: row['glide'],
    #     turn: row['turn'],
    #     fade: row['fade']
    # })
    Disc.create!(row.to_hash)
end


puts "There are now #{Disc.count} rows in the disc table"
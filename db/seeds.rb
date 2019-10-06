# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

friend = User.find_or_create_by(email: "yuyuvn@mac.com")
friend.update_attributes name: "Phan Viet Duc",
  password: "12345678",
  password_confirmation: "12345678"
  
user = User.find_by(email: "cliciavn@gmail.com")

Friend.find_or_create_by user: user, friend: friend, accepted: true

if (friend.goals.count == 0)
    friend.goals.create goal: 400, title: FFaker::Lorem.sentence, private: false, deadline: 1.days.ago, created_at: 10.days.ago
    friend.goals.create goal: 50, title: FFaker::Lorem.sentence, private: false, deadline: 2.days.ago, created_at: 10.days.ago
end
if (user.goals.count == 0)
    user.goals.find_or_create_by goal: 300, title: FFaker::Lorem.sentence, private: false, deadline: 5.days.from_now, created_at: 3.days.ago
end

users = [friend, user]

Category.all.each {|cat|
    times = Random.new.rand(0..cat.words.count)
    times.times do
        word = cat.words.order("RAND()").limit(1).first
        users.each do |u|
            next if FFaker::Boolean.random
            correct = FFaker::Boolean.random
            Result.create(:word => word,:user => u,:correct => correct, created_at: Random.new.rand(0..30).days.ago)
            unless correct
               kanji_characters = word.text.scan(/[\p{Han}]/)
               kanji_characters.each_with_index do |character, index|
                  wkanji = WrongKanji.find_or_create_by({user: u, kanji: character})
                  wkanji.update_attributes(times: wkanji.times + 1) 
               end
            end
        end
    end
}
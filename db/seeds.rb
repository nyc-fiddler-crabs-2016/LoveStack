# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)


# user = User.create(email:"bigbog@bob.com", password:"password")
# User.create(email:"littlebob@bob.com", password:"password")
# User.create(email:"testuser@bob.com", password:"password")

Tag.create(name:"Ruby")
Tag.create(name:"JavaScript")
Tag.create(name:"Life")


# Question.create(title: "How do I make a class", content:"how can you make a ruby class?", user_id:1)
# Question.create(title: "What is Ruby", content:"What is this Ruby Stuff?", user_id:1)


# Response.create(content:"You're a Noob", user_id: 2, responsible_id: 2)
# Response.create(content:"Go away", user_id: 3)

# Answer.create(question_id:2, content:"It's a programming language", user_id:3)

# Answer.create(question_id: 2, content:"a programming language", user_id: 3, best: false)

# Vote.create(voteable_type:"Answer", voteable_id:1, vote_status:true, user_id:1)
# Vote.create(voteable_type:"Answer", voteable_id:1, vote_status:true, user_id:1)
# Vote.create(voteable_type:"Answer", voteable_id:1, vote_status:true, user_id:1)
# Vote.create(voteable_type:"Answer", voteable_id:1, vote_status:true, user_id:1)
# Vote.create(voteable_type:"Answer", voteable_id:1, vote_status:false, user_id:1)
andrew = User.create(email:"aykim@gmail.com", password:"test123")
User.create(email:"test@test.com", password:"test")


User.create(email:Faker::Internet.email, password:Faker::Number.number(6))
User.create(email:Faker::Internet.email, password:Faker::Number.number(6))
User.create(email:Faker::Internet.email, password:Faker::Number.number(6))
User.create(email:Faker::Internet.email, password:Faker::Number.number(6))
User.create(email:Faker::Internet.email, password:Faker::Number.number(6))
User.create(email:Faker::Internet.email, password:Faker::Number.number(6))
User.create(email:Faker::Internet.email, password:Faker::Number.number(6))
User.create(email:Faker::Internet.email, password:Faker::Number.number(6))
User.create(email:Faker::Internet.email, password:Faker::Number.number(6))




30.times do

@question = User.find(rand(1..5)).questions.create(title: Faker::Lorem.word, content: Faker::Lorem.sentences(10), tag_id:rand(1..3))

end



Question.all.each do |question|
  10.times do
    question.answers.create(content: Faker::Lorem.sentences(10), user_id:rand(1..10))
  end
end


type = ["Question","Answer"]
up = [true, false]

10.times do
  Response.create(responsible_type:type[rand(0..1)], responsible_id:rand(1..5), content: Faker::Lorem.sentences(5), user_id: rand(1..5))
end


# 40.times do
#   Vote.create(voteable_type:type[rand(0..1)], voteable_id:rand(1..5), user_id: rand(1..5), vote_status: up[rand(0..1)])
# end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  email = Faker::Internet.free_email
  user = User.create(email: email, password: "azerty", password_confirmation: "azerty")
  (1..3).to_a.sample.times do
    Topic.create(user: user, question: Faker::Hipster.sentence + "?")
  end
end

User.all.each do |user|
  (1..4).to_a.sample.times do
    topic = Topic.find((1..Topic.last.id).to_a.sample)
    Post.create(user: user, topic: topic, title: Faker::Book.title, url: Faker::Internet.url)
  end
end

User.all.each do |user|
  (1..4).to_a.sample.times do
    post = Post.find((1..Post.last.id).to_a.sample)
    Comment.create(user: user, post: post, content: Faker::Lorem.paragraph)
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Users
User.destroy_all
5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end
users = User.all

# Posts
Post.destroy_all
10.times do
  published = [true, false].sample
  Post.create(
    title: Faker::Book.title,
    body: Faker::Hacker.say_something_smart,
    state: Post::STATES.sample,
    author_id: users.sample.id,
    published_at: published ? Faker::Time.between(DateTime.now - 30, DateTime.now + 30) : nil
  )
end
posts = Post.all

# tags
Tag.destroy_all
10.times do
  Tag.create(
    name: Faker::Book.genre
  )
end
tags = Tag.all
posts.each do |post|
  post.tags = tags.sample(2)
end

# comments
Comment.destroy_all
20.times do
  approved = [true, false].sample
  Comment.create(
    post_id: posts.sample.id,
    body: Faker::Hacker.say_something_smart,
    approved: approved,
    approved_at: approved ? Faker::Time.between(DateTime.now - 30, DateTime.now) : nil
  )
end

# Links
Link.destroy_all
20.times do
  Link.create(
    href: Faker::Internet.url
  )
end

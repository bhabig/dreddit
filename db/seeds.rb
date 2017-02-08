# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "mike", email: "mike@email.com", password: "password1")
User.create(name: "jake", email: "jake@email.com", password: "password1")
User.create(name: "steve", email: "steve@email.com", password: "password1")
User.create(name: "jim", email: "jim@email.com", password: "password1")

Post.create(title: "new post 1", content: "this is my newest post", user_id: 1)
Post.create(title: "new post 2", content: "this is my newest post", user_id: 1)
Post.create(title: "new post 3", content: "this is my newest post", user_id: 2)
Post.create(title: "new post 4", content: "this is my newest post", user_id: 3)
Post.create(title: "new post 5", content: "this is my newest post", user_id: 4)
Post.create(title: "new post 6", content: "this is my newest post", user_id: 4)

Tag.create(name: "emo")
Tag.create(name: "political")
Tag.create(name: "sports")
Tag.create(name: "entertainment")
Tag.create(name: "poetry")

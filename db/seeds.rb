# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Admin user
User.create!(username: "admin", email: "admin@mail.azg", password: "adminadmin", admin: true)

(1..10).each do |i|
  user = User.create!(username: "testuser#{i}", email: "testuser#{i}@mail.azg", password: "testuser#{i}")
end
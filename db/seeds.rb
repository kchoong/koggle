# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Admin user
User.create!(username: "admin", email: "admin@mail.azg", password: "adminadmin", admin: true)

(1..5).each do |i|
  Group.create!(name: "testgroup#{i}", description: "Test Group #{i}")
end

(1..10).each do |i|
  group = Group.find(rand(1..5))
  user = User.create!(username: "testuser#{i}", email: "testuser#{i}@mail.azg", password: "testuser#{i}", group: group)
  profile = user.profile
  profile.update!(firstname: "Test#{i}", lastname: "User#{i}", birthday: Time.at(rand * Time.now.to_i), gender: rand(0..3))
end

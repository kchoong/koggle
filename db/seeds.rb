# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..10).each do |i|
  Person.create!(lastname: "testperson#{i}", birthday: Time.at(rand * Time.now.to_i), gender: rand(0..3))
end

(1..5).each do |i|
  Organization.create!(name: "testorg#{i}", description: "Test Organization #{i}")
end
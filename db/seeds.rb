# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Set locale for faker
# Faker::Config.locale = :de

# Admin user/worker
admin_worker = Worker.create!(last_name: "Admin")
admin_user = User.create!(username: "admin", email: "admin@koggle.azg", password: "adminadmin", worker:admin_worker, admin: true)


# Offices
(1..50).each do |i|
  office = Office.create!(name: Faker::Company.unique.name,
                          description: Faker::Commerce.department(max: 5),
                          address_1: Faker::Address.street_address,
                          address_2: Faker::Address.secondary_address,
                          postcode: Faker::Address.postcode,
                          city: Faker::Address.city,
                          country: Faker::Address.country)
end

# Users and workers
(1..250).each do |i|
  office = Office.order('RANDOM()').first

  worker = Worker.create!(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          birthday: Faker::Date.birthday(min_age: 18, max_age: 80),
                          address_1: Faker::Address.street_address,
                          address_2: Faker::Address.secondary_address,
                          postcode: Faker::Address.postcode,
                          city: Faker::Address.city,
                          country: Faker::Address.country,
                          work_hours: rand(10..40),
                          vacation_days: rand(7..28),
                          office: office)

  username = Faker::Internet.unique.username
  email = "#{username}@koggle.azg"
  password = Faker::Internet.password
  user = User.create!(username: username, email: email, password: password, worker: worker)
end

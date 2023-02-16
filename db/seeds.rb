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
admin_worker = Worker.create!(first_name: "Kevin", last_name: "Choong")
admin_user = User.create!(username: "admin", email: "admin@koggle.azg", password: "adminadmin", worker:admin_worker, admin: true)

# Offices
(1..25).each do |i|
  office = Office.create!(name: Faker::Company.unique.name,
                          description: Faker::Commerce.department(max: 5),
                          address_1: Faker::Address.street_address,
                          address_2: Faker::Address.secondary_address,
                          postcode: Faker::Address.postcode,
                          city: Faker::Address.city,
                          country: Faker::Address.country)
end

# Users and workers
(1..100).each do |i|
  office = Office.order('RANDOM()').first

  worker = Worker.create!(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          birthday: Faker::Date.birthday(min_age: 18, max_age: 80),
                          address_1: Faker::Address.street_address,
                          address_2: Faker::Address.secondary_address,
                          postcode: Faker::Address.postcode,
                          city: Faker::Address.city,
                          country: Faker::Address.country,
                          work_hours: rand(4..12),
                          vacation_days: rand(7..28),
                          office: office)

  username = Faker::Internet.unique.username
  email = "#{username}@koggle.azg"
  password = Faker::Internet.password
  user = User.create!(username: username, email: email, password: password, worker: worker)
end

# Work shifts and vacations (might overlap for now)
Worker.all.drop(1).each do |worker|
  # Work shifts
  (1..100).each do |i|
    day = Faker::Date.unique.between(from: 1.year.ago.to_date, to: Date.today)
    start_time = Faker::Time.between_dates(from: day - 1, to: day, period: :morning)
    end_time = Faker::Time.between_dates(from: day - 1, to: day, period: :evening)

    # 80% Chance to work at their main office
    if rand > 0.8
      office = Office.order('RANDOM()').first
      Shift.create!(worker: worker, office: office, start_time: start_time, end_time: end_time)
    else
      Shift.create!(worker: worker, office: worker.office, start_time: start_time, end_time: end_time)
    end
  end

  # Vacations
  (1..rand(1..3)).each do |i|
    start_date = Faker::Date.unique.between(from: 1.year.ago.to_date, to: Date.today)
    end_date = start_date + rand(7..14)
    Vacation.create!(worker: worker, start_date: start_date, end_date: end_date)
  end

  # Clears used values for all generators
  Faker::UniqueGenerator.clear
end
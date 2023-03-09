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

NUM_ADMINS = 5
NUM_OFFICES = 25
NUM_WORKERS = 100
NUM_SHIFTS = 100
NUM_VACATIONS = 3
NUM_COMMENTS = 10

def create_worker(office=nil)
  worker = Worker.create!(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 birthday: Faker::Date.birthday(min_age: 18, max_age: 80),
                 address_1: Faker::Address.street_address,
                 address_2: Faker::Address.secondary_address,
                 postcode: Faker::Address.postcode,
                 city: Faker::Address.city,
                 country: Faker::Address.country,
                 work_hours: rand(4..8) * 5 * 4,
                 vacation_days: rand(7..28),
                 pin: Faker::Alphanumeric.unique.alphanumeric(number: 6),
                 office: office)

  avatar_path = "cat#{rand(0..9)}.png"
  worker.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'placeholder', avatar_path)),
                       filename: avatar_path, content_type: 'image/jpg')

  worker
end

# Admin users and worker
(1..NUM_ADMINS).each do |i|
  worker = create_worker
  username = "admin#{i}"
  password = "admin#{i}"
  email = "admin#{i}@koggle.azg"
  user = User.create!(username: username, email: email, password: password, worker: worker, admin: true)
end

# Offices
(1..NUM_OFFICES).each do |i|
  office = Office.create!(name: Faker::Company.unique.name,
                          description: Faker::Commerce.department(max: 5),
                          address_1: Faker::Address.street_address,
                          address_2: Faker::Address.secondary_address,
                          postcode: Faker::Address.postcode,
                          city: Faker::Address.city,
                          country: Faker::Address.country)

  worker = create_worker(office)
  username = "testoa#{i}"
  password =  "testoa#{i}"
  email = "testoa#{i}@koggle.azg"
  user = User.create!(username: username, email: email, password: password, worker: worker)
end

# Users and workers
(1..NUM_WORKERS).each do |i|
  worker = create_worker(Office.order('RANDOM()').first)
  username = i > 10 ? Faker::Internet.unique.username : "testuser#{i}"
  password = i > 10 ? Faker::Internet.password : "testuser#{i}"
  email = "#{username}@koggle.azg"
  user = User.create!(username: username, email: email, password: password, worker: worker)
end

# Work shifts, vacations and comments
Faker::UniqueGenerator.clear # Clear before
Worker.all.drop(NUM_ADMINS).each do |worker|
  # Work shifts
  (1..NUM_SHIFTS).each do |i|
    day = Faker::Date.unique.between(from: 1.year.ago.to_date, to: Date.yesterday)
    start_time = Faker::Time.between_dates(from: day, to: day, period: :morning)
    end_time = Faker::Time.between_dates(from: day, to: day, period: :evening)

    # 80% Chance to work at their main office
    if rand > 0.8
      office = Office.order('RANDOM()').first
      Shift.create!(worker: worker, office: office, start_time: start_time, end_time: end_time)
    else
      Shift.create!(worker: worker, office: worker.office, start_time: start_time, end_time: end_time)
    end
  end

  # Vacations
  (1..rand(1..NUM_VACATIONS)).each do |i|
    start_date = Faker::Date.unique.between(from: 1.year.ago.to_date, to: Date.today)
    end_date = start_date + rand(7..14)
    Vacation.create!(worker: worker, start_date: start_date, end_date: end_date)
  end

  # Comments
  (1..rand(1..NUM_COMMENTS)).each do |i|
    Comment.create!(author:Faker::Artist.name, text: Faker::Quote.famous_last_words, commentable_id: worker.id, commentable_type: worker.class)
  end

  # Clears used values for all generators
  Faker::UniqueGenerator.clear
end


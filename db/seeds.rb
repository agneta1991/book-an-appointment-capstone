# # db/seeds.rb

# # Create Admin User
# admin = User.create!(
#   name: 'Admin User',
#   email: 'admin@example.com',
#   password: 'password',
#   password_confirmation: 'password',
#   admin: true
# )

# puts "Admin user created: #{admin.email}"

# # Create Regular Users
# users = []
# 5.times do |i|
#   user = User.create!(
#     name: "User #{i + 1}",
#     email: "user#{i + 1}@example.com",
#     password: 'password',
#     password_confirmation: 'password'
#   )
#   users << user
#   puts "User created: #{user.email}"
# end

# # Create Doctors
# doctors = []
# 3.times do |i|
#   doctor = Doctor.create!(
#     name: "Doctor #{i + 1}",
#     specialization: "Specialty #{i + 1}",
#     years_of_experience: rand(5..20),
#     price_per_appointment: rand(50.0..200.0),
#     user: users.sample  # Assign a random user as the owner of the doctor
#   )
#   doctors << doctor
#   puts "Doctor created: #{doctor.name}"
# end

# # Create Reservations
# 10.times do
#   reservation = Reservation.create!(
#     time: Time.now + rand(1..30).days,
#     date: Date.today + rand(1..30).days,
#     user: users.sample,
#     doctor: doctors.sample,
#     description: Faker::Lorem.sentence
#   )
#   puts "Reservation created for #{reservation.user.name} with #{reservation.doctor.name}"
# end

# puts 'Seed data created successfully!'

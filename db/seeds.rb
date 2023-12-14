admin1 = User.create!(
  email: 'admin1@example.com',
  password: 'adminpassword1',
  password_confirmation: 'adminpassword1',
  name: 'Yousef',
  admin: true
)

admin2 = User.create!(
  email: 'admin2@example.com',
  password: 'adminpassword2',
  password_confirmation: 'adminpassword2',
  name: 'Bwambale',
  admin: true
)

admin3 = User.create!(
  email: 'admin3@example.com',
  password: 'adminpassword3',
  password_confirmation: 'adminpassword3',
  name: 'Wolter',
  admin: true
)

user1 = User.create!(
  email: 'user1@example.com',
  password: 'password1',
  password_confirmation: 'password1',
  name: 'Agneta',
  admin: false
)

user2 = User.create!(
  email: 'user2@example.com',
  password: 'password2',
  password_confirmation: 'password2',
  name: 'Jozi',
  admin: false
)

user3 = User.create!(
  email: 'user3@example.com',
  password: 'password3',
  password_confirmation: 'password3',
  name: 'Arnold',
  admin: false
)

doctors_data = [
  { name: 'Jessica Smith', specialization: 'Dermatology', years_of_experience: 7, price_per_appointment: 250, filename: 'doctor1.jpg' },
  { name: 'Robert Jameson', specialization: 'Family Medicine', years_of_experience: 12, price_per_appointment: 200, filename: 'doctor2.jpg' },
  { name: 'Gabriel Lloyd', specialization: 'Pediatrics', years_of_experience: 5, price_per_appointment: 180, filename: 'doctor3.jpg' },
  { name: 'Aurora Bruit', specialization: 'Obstetrics and Gynecology (OB/GYN)', years_of_experience: 4, price_per_appointment: 300, filename: 'doctor4.jpg' },
  { name: 'Michael D. Valentine', specialization: 'Orthopedics', years_of_experience: 9, price_per_appointment: 300, filename: 'doctor.jpg' }
]

doctors_data.each do |doctor_data|
  doctor = Doctor.create!(
    name: doctor_data[:name],
    specialization: doctor_data[:specialization],
    years_of_experience: doctor_data[:years_of_experience],
    price_per_appointment: doctor_data[:price_per_appointment],
    user_id: admin1.id
  )

  image_path = Rails.root.join('seedImages', doctor_data[:filename])
  doctor.images.attach(io: File.open(image_path), filename: doctor_data[:filename])
end

doctor1 = Doctor.find_by(name: 'Jessica Smith')

# Seed data for 7 reservations
Reservation.create(date: '2023-12-15', user: user1, doctor: doctor1, description: 'Checkup for user1 with Dr. Jessica Smith')
Reservation.create(date: '2023-12-16', user: user1, doctor: doctor1, description: 'Follow-up for user1 with Dr. Jessica Smith')
Reservation.create(date: '2023-12-17', user: user1, doctor: doctor1, description: 'Checkup for user1 with Dr. Jessica Smith')
Reservation.create(date: '2023-12-18', user: user1, doctor: doctor1, description: 'Follow-up for user1 with Dr. Jessica Smith')
Reservation.create(date: '2023-12-19', user: user1, doctor: doctor1, description: 'Checkup for user1 with Dr. Jessica Smith')
Reservation.create(date: '2023-12-20', user: user1, doctor: doctor1, description: 'Follow-up for user1 with Dr. Jessica Smith')
Reservation.create(date: '2023-12-21', user: user1, doctor: doctor1, description: 'Checkup for user1 with Dr. Jessica Smith')

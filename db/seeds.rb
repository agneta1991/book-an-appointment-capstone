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

doctor1 = Doctor.create!(
  id: 1,
  name: 'Jessica Smith',
  specialization: 'Dermatology',
  years_of_experience: 7,
  price_per_appointment: 250,
  user_id: admin1.id,
  img: ''
)

doctor2 = Doctor.create!(
  id: 2,
  name: 'Robert Jameson',
  specialization: 'Family Medicine',
  years_of_experience: 12,
  price_per_appointment: 200,
  user_id: admin1.id,
  img: ''
)

doctor3 = Doctor.create!(
  id: 3,
  name: 'Gabriel Lloyd',
  specialization: 'Pediatrics',
  years_of_experience: 14,
  price_per_appointment: 180,
  user_id: admin1.id,
  img: ''
)

doctor4 = Doctor.create!(
  id: 4,
  name: 'Aurora Bruit',
  specialization: 'Obstetrics and Gynecology (OB/GYN)',
  years_of_experience: 4,
  price_per_appointment: 300,
  user_id: admin1.id,
  img: ''
)

doctor5 = Doctor.create!(
  id: 5,
  name: 'Michael D. Valentine',
  specialization: 'Orthopedics',
  years_of_experience: 9,
  price_per_appointment: 300,
  user_id: admin1.id,
  img: ''
)

reservation1 = Reservation.create!(
  id: 1,
  time: '14:20',
  date: '30/12/2023',
  user: user1,
  doctor: doctor1,
  description: 'Description for Reservation 1'
)

reservation2 = Reservation.create!(
  id: 2,
  time: '15:20',
  date: '30/12/2023',
  user: user2,
  doctor: doctor1,
  description: 'Description for Reservation 2'
)

reservation3 = Reservation.create!(
  id: 3,
  time: '16:20',
  date: '30/12/2023',
  user: user3,
  doctor: doctor1,
  description: 'Description for Reservation 3'
)

reservation4 = Reservation.create!(
  id: 4,
  time: '14:20',
  date: '01/01/2024',
  user: admin1,
  doctor: doctor2,
  description: 'Description for Reservation 4'
)

reservation5 = Reservation.create!(
  id: 5,
  time: '15:20',
  date: '01/01/2024',
  user: admin2,
  doctor: doctor2,
  description: 'Description for Reservation 5'
)

reservation6 = Reservation.create!(
  id: 6,
  time: '16:20',
  date: '01/01/2024',
  user: admin3,
  doctor: doctor2,
  description: 'Description for Reservation 6'
)

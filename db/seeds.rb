# User.create!(id: 22, email: 'user22@example.com', password: 'password1', name: 'User One', admin: false)
# User.create!(id: 23, email: 'user23@example.com', password: 'password2', name: 'User Two', admin: false)
# User.create!(id: 24, email: 'user24@example.com', password: 'password3', name: 'User Three', admin: false)
# User.create!(id: 25, email: 'admin25@example.com', password: 'adminpassword1', name: 'Admin One', admin: true)
# User.create!(id: 26, email: 'admin26@example.com', password: 'adminpassword2', name: 'Admin Two', admin: true)
# User.create!(id: 27, email: 'admin27@example.com', password: 'adminpassword3', name: 'Admin Three', admin: true)

user = User.create!(email: 'user290@example.com', password: 'password1', name: 'User One', admin: false)


Doctor.create!(name: 'Jessica Smith', specialization: 'Dermatology', years_of_experience: 7, price_per_appointment: 250, user: user)
# Doctor.create!(id: 2, name: 'Robert Jameson', img: '', specialization: 'Family Medicine', years_of_experience: 12, price_per_appointment: 200)
# Doctor.create!(id: 3, name: 'Gabriel Lloyd', img: '', specialization: 'Pediatrics', years_of_experience: 14, price_per_appointment: 180)
# Doctor.create!(id: 4, name: 'Aurora Bruit', img: '', specialization: 'Obstetrics and Gynecology (OB/GYN)', years_of_experience: 4, price_per_appointment: 300)
# Doctor.create!(id: 5, name: 'Michael D. Valentine', img: '', specialization: 'Orthopedics', years_of_experience: 9, price_per_appointment: 300)

# Reservation.create(id: 1, time: '14:20', date: '30/12/2023', user_id: 28, doctor_id: 1, description: 'Description for Reservation 1')
# Reservation.create(id: 2, time: '15:20', date: '30/12/2023', user_id: 28, doctor_id: 3, description: 'Description for Reservation 2')
# Reservation.create(id: 3, time: '16:20', date: '30/12/2023', user_id: 28, doctor_id: 1, description: 'Description for Reservation 3')
# Reservation.create(id: 4, time: '14:20', date: '01/01/2024', user_id: 28, doctor_id: 2, description: 'Description for Reservation 4')
# Reservation.create(id: 5, time: '15:20', date: '01/01/2024', user_id: 28, doctor_id: 3, description: 'Description for Reservation 5')
# Reservation.create(id: 6, time: '16:20', date: '01/01/2024', user_id: 28, doctor_id: 2, description: 'Description for Reservation 6')

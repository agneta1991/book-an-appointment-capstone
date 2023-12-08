admin1 = User.create!(
  email: 'admin1@example1.com',
  password: 'adminpassword1',
  password_confirmation: 'adminpassword1',
  name: 'Yousef',
  admin: true
)

admin2 = User.create!(
  email: 'admin2@example2.com',
  password: 'adminpassword2',
  password_confirmation: 'adminpassword2',
  name: 'Bwambale',
  admin: true
)

admin3 = User.create!(
  email: 'admin3@example3.com',
  password: 'adminpassword3',
  password_confirmation: 'adminpassword3',
  name: 'Wolter',
  admin: true
)

user1 = User.create!(
  email: 'user1@example4.com',
  password: 'password1',
  password_confirmation: 'password1',
  name: 'Agneta',
  admin: false
)

user2 = User.create!(
  email: 'user2@example5.com',
  password: 'password2',
  password_confirmation: 'password2',
  name: 'Jozi',
  admin: false
)

user3 = User.create!(
  email: 'user3@example3.com',
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
  img: 'https://images.pexels.com/photos/3714743/pexels-photo-3714743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  description: 'Meet Dr. Jessica Smith, an esteemed dermatologist with 7 years of expertise dedicated to elevating skin health. Dr. Smith is committed to providing personalized care, ensuring that every patient feels heard and valued.

  Experience meticulous skin analysis and tailored recommendations during consultations with Dr. Smith. Her compassionate approach delves into the root of skin concerns, offering comprehensive solutions for your unique needs. Private appointments with Dr. Jessica Smith are affordably priced at $250.
  
  Embark on a journey to radiant skin with Dr. Jessica Smith. Book your private appointment today and discover the confidence that comes with top-notch dermatological care. Your skin deserves the best, and Dr. Smith is here to deliver it.'
  )

doctor2 = Doctor.create!(
  id: 2,
  name: 'Robert Jameson',
  specialization: 'Family Medicine',
  years_of_experience: 12,
  price_per_appointment: 200,
  user_id: admin1.id,
  img: 'https://images.pexels.com/photos/8460094/pexels-photo-8460094.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  description: <<-DESC
    Meet Dr. Robert Jameson, a seasoned professional in Family Medicine with a wealth of experience spanning 12 years. Dr. Jameson is dedicated to providing comprehensive and compassionate healthcare for individuals and families alike.

    During consultations with Dr. Jameson, expect a thorough examination and personalized care that addresses your health concerns. His commitment to excellence is reflected in the quality of service he provides. Private appointments with Dr. Robert Jameson are available at an affordable rate of $200.

    Take a proactive approach to your family's health with Dr. Robert Jameson. Book your private appointment today and entrust your healthcare needs to an experienced and caring Family Medicine practitioner. Your well-being is paramount, and Dr. Jameson is here to support you on your health journey.
  DESC
)

doctor3 = Doctor.create!(
  id: 3,
  name: 'Gabriel Lloyd',
  specialization: 'Pediatrics',
  years_of_experience: 5,
  price_per_appointment: 180,
  user_id: admin1.id,
  img: 'https://images.pexels.com/photos/6627931/pexels-photo-6627931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  description: <<-DESC
  Meet Dr. Gabriel Lloyd, a dedicated pediatrician with 5 years of experience devoted to the well-being of your little ones. Dr. Lloyd is passionate about providing specialized and compassionate care to ensure the health and happiness of every child under his watchful eye.

  Dr. Lloyd's consultations are characterized by a gentle and thorough approach, putting both parents and children at ease. With a commitment to excellence, he offers personalized recommendations tailored to each child's unique needs. Private appointments with Dr. Gabriel Lloyd are available at an affordable rate of $180.

  Prioritize your child's health with Dr. Gabriel Lloyd. Book a private appointment today and experience the peace of mind that comes with entrusting your child's care to a caring and experienced pediatrician. Dr. Lloyd is here to support your family's journey to a healthy and happy childhood.
DESC
)

doctor4 = Doctor.create!(
  id: 4,
  name: 'Aurora Bruit',
  specialization: 'Obstetrics and Gynecology (OB/GYN)',
  years_of_experience: 4,
  price_per_appointment: 300,
  user_id: admin1.id,
  img: 'https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  description: <<-DESC
  Meet Dr. Aurora Bruit, a dedicated practitioner in Obstetrics and Gynecology (OB/GYN) with 4 years of specialized experience. Dr. Bruit is committed to providing comprehensive and personalized care to women, focusing on their reproductive health and overall well-being.

  Dr. Bruit's consultations are marked by a compassionate and attentive approach, ensuring each patient feels supported and informed. With a commitment to excellence, she offers thorough examinations and personalized recommendations tailored to individual needs. Private appointments with Dr. Aurora Bruit are available at a competitive rate of $300.

  Prioritize your reproductive health with Dr. Aurora Bruit. Book a private appointment today and experience the confidence that comes with entrusting your care to a dedicated and experienced OB/GYN practitioner. Dr. Bruit is here to support and empower women on their journey to optimal health.
DESC
)

doctor5 = Doctor.create!(
  id: 5,
  name: 'Michael D. Valentine',
  specialization: 'Orthopedics',
  years_of_experience: 9,
  price_per_appointment: 300,
  user_id: admin1.id,
  img: 'https://images.pexels.com/photos/5327656/pexels-photo-5327656.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  description: 'Meet Dr. Michael D. Valentine, a highly experienced orthopedic specialist with 9 years of expertise dedicated to musculoskeletal health. Dr. Valentine is committed to providing comprehensive and personalized care, focusing on the diagnosis, treatment, and prevention of orthopedic conditions.

  In consultations with Dr. Valentine, expect a thorough examination and compassionate guidance on your orthopedic concerns. His commitment to excellence is evident in the quality of care he delivers. Private appointments with Dr. Michael D. Valentine are available at a competitive rate of $300.
  
  Take a proactive step towards your musculoskeletal well-being with Dr. Michael D. Valentine. Book your private appointment today and experience the confidence that comes with entrusting your orthopedic care to a seasoned and caring specialist. Dr. Valentine is here to support you on your journey to optimal mobility and health.'
  )

doctor6 = Doctor.create!(
  id: 6,
  name: 'Emily Anderson',
  specialization: 'Neurology',
  years_of_experience: 8,
  price_per_appointment: 280,
  user_id: admin1.id,
  img: 'https://images.pexels.com/photos/7904483/pexels-photo-7904483.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  description: 'Meet Dr. Emily Anderson, a distinguished neurologist with 8 years of specialized experience devoted to the intricate field of neurology. Dr. Anderson is dedicated to providing thorough and compassionate care, focusing on the diagnosis and treatment of neurological conditions.

  During consultations with Dr. Anderson, expect a meticulous examination and personalized recommendations tailored to address your neurological concerns. Her commitment to excellence is reflected in the quality of care she provides. Private appointments with Dr. Emily Anderson are available at a competitive rate of $280.
  
  Take a proactive step towards neurological well-being with Dr. Emily Anderson. Book your private appointment today and experience the confidence that comes with entrusting your neurological care to a skilled and caring specialist. Dr. Anderson is here to support you on your journey to optimal brain health.'
)

doctor7 = Doctor.create!(
  id: 7,
  name: 'Daniel Ramirez',
  specialization: 'Cardiology',
  years_of_experience: 10,
  price_per_appointment: 320,
  user_id: admin1.id,
  img: 'https://images.pexels.com/photos/7966284/pexels-photo-7966284.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  description: 'Meet Dr. Daniel Ramirez, a distinguished cardiologist with 10 years of expertise dedicated to heart health. Dr. Ramirez is committed to providing comprehensive and personalized care, focusing on the prevention, diagnosis, and treatment of cardiovascular conditions.

  During consultations with Dr. Ramirez, expect a thorough cardiac examination and compassionate guidance on your cardiovascular concerns. His commitment to excellence is evident in the quality of care he delivers. Private appointments with Dr. Daniel Ramirez are available at a competitive rate of $320.
  
  Take a proactive step towards heart health with Dr. Daniel Ramirez. Book your private appointment today and experience the confidence that comes with entrusting your cardiovascular care to a seasoned and caring specialist. Dr. Ramirez is here to support you on your journey to optimal heart health.'
)

doctor8 = Doctor.create!(
  id: 8,
  name: 'Sophia Patel',
  specialization: 'Ophthalmology',
  years_of_experience: 6,
  price_per_appointment: 230,
  user_id: admin1.id,
  img: 'https://images.pexels.com/photos/14438787/pexels-photo-14438787.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  description: 'Meet Dr. Sophia Patel, a dedicated ophthalmologist with 6 years of specialized experience committed to the well-being of your vision. Dr. Patel focuses on providing comprehensive eye care, ranging from routine examinations to advanced treatments for various eye conditions.

  In consultations with Dr. Patel, expect a detailed eye examination and personalized recommendations tailored to address your visual health concerns. Her commitment to excellence is evident in the quality of care she provides. Private appointments with Dr. Sophia Patel are available at a competitive rate of $230.
  
  Take a proactive step towards maintaining optimal vision with Dr. Sophia Patel. Book your private appointment today and experience the confidence that comes with entrusting your eye care to a caring and experienced specialist. Dr. Patel is here to support you on your journey to clear and healthy vision.'
)

doctor9 = Doctor.create!(
  id: 9,
  name: 'Anthony Martinez',
  specialization: 'ENT (Ear, Nose, Throat)',
  years_of_experience: 11,
  price_per_appointment: 270,
  user_id: admin1.id,
  img: 'https://images.pexels.com/photos/4989133/pexels-photo-4989133.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  description: '
  Meet Dr. Anthony Martinez, a seasoned specialist in ENT (Ear, Nose, Throat) with 11 years of expertise devoted to the intricate field of head and neck health. Dr. Martinez is committed to providing comprehensive and personalized care, addressing a wide range of conditions related to the ear, nose, and throat.
  
  During consultations with Dr. Martinez, expect a thorough examination and compassionate guidance on your ENT concerns. His commitment to excellence is evident in the quality of care he delivers. Private appointments with Dr. Anthony Martinez are available at a competitive rate of $270.
  
  Take a proactive step towards head and neck health with Dr. Anthony Martinez. Book your private appointment today and experience the confidence that comes with entrusting your ENT care to a skilled and caring specialist. Dr. Martinez is here to support you on your journey to optimal well-being.'
)


reservation1 = Reservation.create!(
  time: '14:20',
  date: '30/12/2023',
  user: user1,
  doctor: doctor1,
  description: 'Description for Reservation 1'
)

reservation2 = Reservation.create!(
  time: '15:20',
  date: '30/12/2023',
  user: user2,
  doctor: doctor1,
  description: 'Description for Reservation 2'
)

reservation3 = Reservation.create!(
  time: '16:20',
  date: '30/12/2023',
  user: user3,
  doctor: doctor1,
  description: 'Description for Reservation 3'
)

reservation4 = Reservation.create!(
  time: '14:20',
  date: '01/01/2024',
  user: admin1,
  doctor: doctor2,
  description: 'Description for Reservation 4'
)

reservation5 = Reservation.create!(
  time: '15:20',
  date: '01/01/2024',
  user: admin2,
  doctor: doctor2,
  description: 'Description for Reservation 5'
)

reservation6 = Reservation.create!(
  time: '16:20',
  date: '01/01/2024',
  user: admin3,
  doctor: doctor2,
  description: 'Description for Reservation 6'
)
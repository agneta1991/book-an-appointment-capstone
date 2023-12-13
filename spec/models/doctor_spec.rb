# spec/models/doctor_spec.rb

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password123') }

  it 'is not valid without a specialization' do
    doctor = Doctor.new(
      name: 'Dr. Test',
      price_per_appointment: 200.0,
      years_of_experience: 10,
      user: user
    )
    expect(doctor).to_not be_valid
  end

  it 'is not valid when specialization is longer than 255 characters' do
    doctor = Doctor.new(
      name: 'Dr. Another Test',
      specialization: 'a' * 256, # Create a string longer than 255 characters
      price_per_appointment: 180.0,
      years_of_experience: 5,
      user: user
    )
    expect(doctor).to_not be_valid
  end

  it 'is not valid with a negative price_per_appointment' do
    doctor = Doctor.new(
      name: 'Dr. Negative Price',
      specialization: 'Dentistry',
      price_per_appointment: -100.0,
      years_of_experience: 15,
      user: user
    )
    expect(doctor).to_not be_valid
  end

  it 'is not valid with a negative years_of_experience' do
    doctor = Doctor.new(
      name: 'Dr. Negative Experience',
      specialization: 'Oncology',
      price_per_appointment: 250.0,
      years_of_experience: -3,
      user: user
    )
    expect(doctor).to_not be_valid
  end
end

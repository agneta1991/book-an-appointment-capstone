require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:user) { User.create(id: 1, name: 'Agneta', email: 'agneta@agneta.com', password: 'password', admin: true) }
  let(:doctor) do
    Doctor.create(
      id: 1, name: 'Jozi', specialization: 'Pediatric', years_of_experience: 10, price_per_appointment: 150.5,
      user_id: 1, img: ''
    )
  end

  describe 'validations' do
    subject { doctor }

    it 'is not valid without a specialization' do
      doctor.specialization = ''
      is_expected.not_to be_valid
    end

    it 'is not valid when specialization is longer than 250 characters' do
      doctor.specialization = 'a' * 251
      is_expected.not_to be_valid
    end

    it 'is not valid with a negative price' do
      doctor.price_per_appointment = -150.5
      is_expected.not_to be_valid
    end

    it 'is not valid with a negative years of experience' do
      doctor.years_of_experience = -10
      is_expected.not_to be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password123') }
  let(:doctor) do
    Doctor.create(name: 'Dr. Smith', specialization: 'Cardiology', years_of_experience: 15, price_per_appointment: 200,
                  user_id: user.id)
  end

  let(:reservation) do
    Reservation.create(user: user, doctor: doctor, date: DateTime.now)
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to a doctor' do
      association = described_class.reflect_on_association(:doctor)
      expect(association.macro).to eq :belongs_to
    end
  end
end

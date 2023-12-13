require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create(
      name: 'Agneta Pupienyte',
      email: 'agneta@pupienyte.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  describe 'validations' do
    subject { user }

    it 'is valid with valid attributes' do
      is_expected.to be_valid
    end

    it 'is not valid without a name' do
      user.name = ''
      is_expected.not_to be_valid
    end

    it 'is not valid without a password' do
      user.password = ''
      is_expected.not_to be_valid
    end

    it 'is not valid without a matching password confirmation' do
      user.password_confirmation = 'mismatchedpassword'
      is_expected.not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many doctors' do
      association = described_class.reflect_on_association(:doctors)
      expect(association.macro).to eq :has_many
    end

    it 'has many reservations' do
      association = described_class.reflect_on_association(:reservations)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'callbacks' do
    it 'generates authentication token before create' do
      expect(user.token).to be_present
    end
  end
end

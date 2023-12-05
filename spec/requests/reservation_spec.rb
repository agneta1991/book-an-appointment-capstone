require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  let(:user) do
    User.create(
      name: 'Agneta Pupienyte',
      email: 'agneta@pupienyte.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  let(:doctor) do
    Doctor.create(
      user_id: user.id,
      name: 'Dr. Smith',
      specialization: 'Pediatric',
      years_of_experience: 7,
      price_per_appointment: 150.0
    )
  end

  let(:reservation_params) do
    {
      reservation: {
        user_id: user.id,
        doctor_id: doctor.id,
        date: '2023-12-15'
      }
    }
  end

  describe 'GET #index' do
    it 'returns a list of reservations for a user' do
      reservation = Reservation.create(user_id: user.id, doctor_id: doctor.id, date: '2023-12-15')
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['reservations'].length).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a specific reservation' do
      reservation = Reservation.create(user_id: user.id, doctor_id: doctor.id, date: '2023-12-15')
      get :show, params: { id: reservation.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['user_id']).to eq(user.id)
    end
  end

  describe 'POST #create' do
    it 'returns errors if creation fails' do
      sign_in user
      invalid_params = reservation_params.deep_merge(reservation: { date: nil })
      post :create, params: invalid_params
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include('date' => ["can't be blank"])
    end
  end
end

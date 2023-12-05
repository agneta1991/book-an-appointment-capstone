require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: :controller do
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

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of doctors in JSON format' do
      get :index
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: doctor.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns the doctor in JSON format' do
      get :show, params: { id: doctor.id }
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) do
      {
        doctor: {
          user_id: user.id,
          name: 'Dr. Johnson',
          specialization: 'Orthopedic Surgeon',
          years_of_experience: 15,
          price_per_appointment: 200.0
        }
      }
    end

    let(:invalid_attributes) do
      {
        doctor: {
          user_id: user.id,
          name: '', # Invalid: Name can't be blank
          specialization: 'Cardiologist',
          years_of_experience: 10,
          price_per_appointment: 150.0
        }
      }
    end

    it 'creates a new doctor with valid attributes' do
      sign_in user
      post :create, params: valid_attributes
      expect(response).to have_http_status(:created)
    end

    it 'returns errors if creation fails' do
      sign_in user
      post :create, params: invalid_attributes
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include("name" => ["can't be blank"])
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) do
      {
        doctor: {
          name: 'Dr. Updated'
        }
      }
    end

    it 'updates the doctor' do
      sign_in user
      put :update, params: { id: doctor.id }.merge(new_attributes)
      expect(response).to have_http_status(:success)
      doctor.reload
      expect(doctor.name).to eq('Dr. Updated')
    end

    it 'returns errors if update fails' do
      sign_in user
      put :update, params: { id: doctor.id }.merge(doctor: { name: '' })
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include("name" => ["can't be blank"])
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the doctor' do
      sign_in user
      delete :destroy, params: { id: doctor.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) do
    User.create(
      name: 'Agneta Pupienyte',
      email: 'agneta@pupienyte.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of users in JSON format' do
      get :index
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'PATCH/PUT #update' do
    let(:new_attributes) { { name: 'New Name' } }

    it 'returns errors if update fails' do
      sign_in user
      put :update, params: { id: user.id, user: { name: '' } }

      puts "Response Body: #{response.body}"

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include('errors' => ["Name can't be blank", "Password can't be blank",
                                                                "Password confirmation can't be blank"])
    end
  end
end

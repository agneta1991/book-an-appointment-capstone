Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :doctors
      resources :reservations, only: [:index, :new, :create, :update, :destroy]
    end
  end
end

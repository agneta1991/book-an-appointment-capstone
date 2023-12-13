Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :doctors, only: [:index, :show, :new, :create, :update, :destroy]
      
      # Explicitly define the route for the 'all' action
      resources :reservations do
        collection do
          get 'all', to: 'reservations#all'
        end
      end
    end
  end
end

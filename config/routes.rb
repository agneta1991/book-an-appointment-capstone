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


devise_scope :user do
  delete '/logout', to: 'users/sessions#destroy', as: :destroy_user_session
end
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :doctors
      resources :reservations
    end
  end
end

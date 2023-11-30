Rails.application.routes.draw do
  devise_for :users

  resource :doctor
  resource :reservation 
end

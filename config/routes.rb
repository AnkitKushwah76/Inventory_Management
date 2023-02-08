Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    password: 'users/password',
    registrations: 'users/registrations'
  }


 
  root "user#index"

  post  "cinvoices", to:"items#cinvoices"
  
  get "buyersIndex", to:"items#buyersIndex"
  resources :user
  resources :items
end

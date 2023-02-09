Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }


 
  root "user#index"

  post  "cinvoices", to:"items#cinvoices"
  
  get "buyersIndex", to:"items#buyersIndex"
  resources :user
  resources :items
end

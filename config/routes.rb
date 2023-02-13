Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root 'user#index'
  post 'invoices', to:'items#invoices'
  get 'my_products', to:'items#my_products'
  resources :user
  resources :items
end

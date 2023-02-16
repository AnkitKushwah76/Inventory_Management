# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root 'user#index'
  get 'my_products', to: 'items#my_products'
  get 'my_orders', to: 'invoices#my_orders'
  post 'destroy_orders', to: 'invoices#destroy_orders'

  resources :user
  resources :items
  resources :invoices
end

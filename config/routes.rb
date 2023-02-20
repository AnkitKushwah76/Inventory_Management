# frozen_string_literal: true
require 'sidekiq/web'
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :user
      resources :items
      resources :invoices
    end
  end
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'user#index'
  get 'all_Products', to: 'user#all_Products'
  get 'my_products', to: 'items#my_products'
  get 'my_orders', to: 'invoices#my_orders'
  post 'destroy_orders', to: 'invoices#destroy_orders'
  resources :user
  resources :items
  resources :invoices
end

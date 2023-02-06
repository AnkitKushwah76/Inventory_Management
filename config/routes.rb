Rails.application.routes.draw do
  get 'selleruser/index'
  get 'selleruser/show'
  get 'selleruser/new'
  get 'selleruser/create'
  get 'selleruser/edit'
  get 'selleruser/update'
  # get 'user/index'
  # get 'user/show'
  # get 'user/new'
  # get 'user/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "user#index"
  get  "/sellerLogin" , to: "user#sellerLogin"
  get "/buyerLogin", to: "user#buyerLogin"

  get "sellercreate", to: "user#sellercreate"
  get "buyercreate", to: "user#buyercreate"
  post "userSignup", to: "user#userSignup"
   post "userLogin", to: "user#userLogin"
  resources :user
end

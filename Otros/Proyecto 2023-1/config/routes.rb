Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "register"
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#index'
  post "requests/create", to: "requests#create"
  post "reviews/create", to: "reviews#create"
  post "products/delete", to: "products#delete"

  resources :products do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews
  resources :chats
  resources :requests

  devise_scope :user do
    get '/logout', to: 'users/sessions#destroy', as: 'logout'
  end
end
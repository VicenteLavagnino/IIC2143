Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, 
                   path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root 'home#index'

  get '/explora', to: 'explora#index'
  get '/nosotros', to: 'nosotros#index'
  get 'trabaja', to: 'trabaja#index'
  get 'contacto', to: 'contacto#index'
  get 'reporta', to: 'reporta#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

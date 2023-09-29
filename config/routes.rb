Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, 
                   path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root 'home#index'

  get '/explora', to: 'home#explora'
  get '/nosotros', to: 'home#nosotros'
  get '/trabaja', to: 'home#trabaja'
  get '/contacto', to: 'home#contacto'
  get '/reporta', to: 'home#reporta'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

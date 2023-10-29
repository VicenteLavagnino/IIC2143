Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, 
                   path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root 'home#index'



  get '/explora', to: 'home#explora'
  get '/nosotros', to: 'home#nosotros'
  get '/trabaja', to: 'home#trabaja'
  get '/contacto', to: 'home#contacto'
  get '/reporta', to: 'home#reporta'

  get '/perfil/gestionar_perfil', to: 'perfil#gestionar_perfil', as: :gestionar_perfil
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"

  #Admin
  get '/admin', to: 'admin#show'
  get '/admin', to: 'admin#create'
  get '/admin/:id', to: 'admin#update'
  get '/admin/:id', to: 'admin#filter'

  delete '/admin/:id', to: 'admin#destroy'

  #usuario
  get '/usuario', to: 'usuario#show'
  get '/usuario', to: 'usuario#create'
  get '/usuario/:id', to: 'usuario#update'
  get '/usuario/:id', to: 'usuario#filter'

  delete '/usuario/:id', to: 'usuario#destroy'

  #visitor
  get '/visitor', to: 'visitor#show'
  get '/visitor', to: 'visitor#create'
  get '/visitor/:id', to: 'visitor#update'
  get '/visitor/:id', to: 'visitor#filter'

  delete '/visitor/:id', to: 'visitor#destroy'

  #product
  get '/product', to: 'product#show', as: :show_product 
  get '/product/new', to: 'product#new', as: :new_product 
  post 'products', to: 'product#create', as: :products
  get '/product/:id/edit', to: 'product#edit', as: :edit_product 
  put '/product/:id', to: 'product#update', as: :update_product 
  get '/product/:id/filter', to: 'product#filter', as: :filter_product 
  delete '/product/:id', to: 'product#destroy', as: :delete_product
  get 'my_legos', to: 'product#my_legos'


  #request
  get '/request', to: 'request#show'
  get '/request', to: 'request#create'
  get '/request/:id', to: 'request#update'
  get '/request/:id', to: 'request#filter'

  delete '/request/:id', to: 'request#destroy'

  #review
  get '/review', to: 'review#show'
  get '/review', to: 'review#create'
  get '/review/:id', to: 'review#update'
  get '/review/:id', to: 'review#filter'

  delete '/review/:id', to: 'review#destroy'

  #chat
  get '/chat', to: 'chat#show'
  get '/chat', to: 'chat#create'
  get '/chat/:id', to: 'chat#update'
  get '/chat/:id', to: 'chat#filter'

  delete '/chat/:id', to: 'chat#destroy'

  #ChatUser

  get '/chatuser', to: 'chatuser#show'
  get '/chatuser', to: 'chatuser#create'
  get '/chatuser/:id', to: 'chatuser#update'
  get '/chatuser/:id', to: 'chatuser#filter'

  delete '/chatuser/:id', to: 'chatuser#destroy'

end

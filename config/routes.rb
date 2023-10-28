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

  get '/reports/user_reports', to: 'reports#user_reports', as: :user_reports
  delete '/reports/:id', to: 'reports#destroy', as: :delete_report
  

  #product
  get '/product', to: 'product#show'
  get '/product', to: 'product#create'
  get '/product/:id', to: 'product#update'
  get '/product/:id', to: 'product#filter'

  delete '/product/:id', to: 'product#destroy'

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

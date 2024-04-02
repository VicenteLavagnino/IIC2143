Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index" 

  # permite recuperar todas las personas
  get "/persons", to:"persons#index"
  # permite registrar una persona en la base de datos
  post "/persons", to:"persons#create"
  # permite recuperar los datos de una persona en base al id
  get "/persons/:id", to:"persons#show"
  # permite borrar todas las personas de la base de datos
  delete "/persons", to:"persons#destroy_all"

  # permite recuperar todas las vacunas de una persona
  get "/persons/:person_id/vaccines", to:"vaccines#index"
  # permite registrar una vacuna
  post "/persons/:person_id/vaccines", to:"vaccines#create"
  # permite actualizar la informacion de una vacuna
  patch "/persons/:person_id/vaccines/:id", to:"vaccines#update" 
  # permite recuperar la informacion de una vacuna especifica
  delete "/persons/:person_id/vaccines/:id", to:"vaccines#destroy"

end
 
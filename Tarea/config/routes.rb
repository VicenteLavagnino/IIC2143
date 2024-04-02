Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "directors#index"

  # routes for part 1
  get '/director/:id', to: 'directors#show'
  delete '/director/:id', to: 'directors#destroy'
  delete '/directors', to: 'directors#destroy_all'
  get '/directors/oscars', to: 'directors#oscars'

  resources :directors, only: [:index]
  resources :directors, only: [:create]


  #routes for part 2
  get '/director/:director_id/movies', to: 'directors#movies'
  post '/director/:director_id/movies', to: 'directors#create_movie'
  patch '/director/:director_id/movies/:movie_id', to: 'directors#update_movie'
  get '/movies/sinopsis/:keyword', to: 'movies#search_by_sinopsis'


  #routes for part 3
  post '/ranking/:director_id', to: 'rankings#create'
  get '/ranking/:director_id', to: 'rankings#index'
  get '/ranking/top/:quantity', to: 'rankings#top'
  get '/movies/:movie_id/director/rankings', to: 'movies#director_rankings'
  delete '/director/ranking/low', to: 'directors#delete_lowest_ranked_director'
  get '/ranking/pages/all', to: 'rankings#all_rankings_by_page'

end

Rails.application.routes.draw do
  get '/videogames/new', to: 'videogames#new'
  post '/videogames', to: 'videogames#create'
  get '/videogames/:id', to: 'videogames#show'
  get '/', to: 'videogames#index'
  get '/videogames', to: 'videogames#index'
end

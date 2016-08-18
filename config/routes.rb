Rails.application.routes.draw do
  get '/videogames/:id', to: 'videogames#show'
  get '/', to: 'videogames#index'
  get '/videogames', to: 'videogames#index'
end

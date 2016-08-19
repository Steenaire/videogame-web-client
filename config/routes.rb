Rails.application.routes.draw do
  get '/videogames/new', to: 'videogames#new'
  post '/videogames', to: 'videogames#create'
  get '/videogames/:id', to: 'videogames#show'
  get '/', to: 'videogames#index'
  get '/videogames', to: 'videogames#index'
  get '/videogames/:id/edit', to: 'videogames#edit', as: 'edit_videogame'
  patch '/videogames/:id/', to: 'videogames#update'
  delete '/videogames/:id', to: 'videogames#destroy'
end

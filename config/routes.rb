Rails.application.routes.draw do
  resources :users
  resources :events
  resources :event_invites

  root 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end

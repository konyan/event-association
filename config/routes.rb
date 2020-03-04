Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'events#index'
  post '/create_attend', to: 'events#create_attend'
  get '/signin', to:'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signup' , to: 'users#new'
  post '/signup' , to: 'users#create'
  delete '/signout', to: 'sessions#destroy'
  resources :users , only: %i[new create index show]
  resources :events, only: %i[new create index show]
end

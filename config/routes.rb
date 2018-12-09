Rails.application.routes.draw do

  root 'items#index'
  get 'items/index'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      get 'products', to: 'products#index'
      get 'products/:id', to: 'products#show'
    end
  end
end

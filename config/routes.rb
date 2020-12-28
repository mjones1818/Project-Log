Rails.application.routes.draw do

  resources :users
  resources :types
  resources :tools
  resources :parts
  resources :projects
  get '/', to: 'projects#index', as: "home"
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  post '/login', to: 'sessions#login', as: 'login'
  delete '/logout', to: 'sessions#logout', as: 'logout'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/project/:id/parts/quantities', to: 'parts#quantities', as: 'quantity' 
  patch '/project/:id/parts/quantities', to: 'parts#quantity_update', as: 'quantity_update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

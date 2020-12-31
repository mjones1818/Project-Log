Rails.application.routes.draw do
  delete '/projects/:id', to: 'projects#delete', as: 'delete_project'
  resources :users, only: [:show]
  resources :types, only: [:show] do
    resources :projects, only: [:show]
  end
  resources :parts, only: [:show]
  resources :projects, except: [:delete]
  
  get '/', to: 'projects#index', as: "home"
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  post '/login', to: 'sessions#login', as: 'login'
  delete '/logout', to: 'sessions#logout', as: 'logout'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'new_user'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/project/:id/parts/quantities/new', to: 'parts#quantities', as: 'quantity' 
  patch '/project/:id/parts/quantities/edit', to: 'parts#quantity_update', as: 'quantity_update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
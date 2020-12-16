Rails.application.routes.draw do

  resources :users
  resources :types
  resources :tools
  resources :parts
  resources :projects
  get '/', to: 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

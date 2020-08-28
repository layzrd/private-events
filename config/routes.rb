Rails.application.routes.draw do
  resources :events
  get 'session/new'
  post 'session/create'
  get 'session/destroy'
  # resources :users
  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index]
end

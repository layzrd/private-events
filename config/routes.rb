Rails.application.routes.draw do
  get 'session/new'
  post 'session/create'
  get 'session/destroy'
  # resources :users
  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create show index]
  resources :events, only: %i[new create show index]
end

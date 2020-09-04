Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[new create show index edit]
  resources :events, only: %i[new create show index edit]
  root 'users#index'
end

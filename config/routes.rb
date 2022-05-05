Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'user_sessions/new'
  get 'user_sessions/create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :events, only: %i[new create show destroy]

end

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'


  resources :users, only: %i[new create]
  resources :events do 
    resources :circles do
      resources :items
    end
  end
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

end

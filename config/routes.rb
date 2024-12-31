Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'

  resources :posts, only: [:index, :show, :new, :create]

  resource :profile, only: [:show, :new, :create, :edit, :update]
end

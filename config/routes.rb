Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'

  resources :posts, only: [:index, :show, :new, :create, :destroy]

  resource :profile, only: [:show, :new, :create, :edit, :update]

  namespace :api do
    scope 'posts/:post_id' do
      resources :comments, only: [:index, :create, :destroy]
      resource :like, only: [:create, :destroy]
    end
  end
end

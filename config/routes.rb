Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'

  resources :posts, only: [:index, :show, :new, :create, :destroy]
  resources :accounts, only: [:show]

  resource :profile, only: [:show, :new, :create, :edit, :update]

  namespace :api do
    scope 'posts/:post_id' do
      resources :comments, only: [:index, :create, :destroy]
      resource :like, only: [:show, :create, :destroy]
    end

    scope 'accounts/:account_id' do
      resources :follows, only: [:create]
      resources :unfollows, only: [:create]
    end
  end
end

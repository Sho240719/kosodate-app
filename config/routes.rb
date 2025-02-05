require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'

  resources :posts, only: [:index, :show, :new, :create, :destroy]
  resources :worries, only: [:index]
  resources :dailies, only: [:index]
  resources :friends, only: [:index]

  resource :profile, only: [:show, :new, :create, :edit, :update]
  resource :timeline, only: [:show]

  resources :accounts, only: [:show] do
    resources :followings, only: [:index]
  end

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

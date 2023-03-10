Rails.application.routes.draw do
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'public#homepage'

  resources :posts, only: [:new, :create, :show, :destroy]

  resources :comments, only: [:create, :destroy]

  get "dashboard", to: 'accounts#index'

  get "profile/:username", to: 'accounts#profile', as: :profile

  put "post/like/:post_id", to: 'likes#save_like', as: :like_post

  post "follow/account", to: "accounts#follow_account", as: :follow_account

  put "unfollow/account/:following_id", to: "accounts#unfollow_account", as: :unfollow_account

  get "search", to: 'accounts#search'

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do

  root to: 'lists#index'

  # root to: 'bookmarks#new'

  # root to: 'bookmarks#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # get "movies", to: "movies#index"

  # get "bookmarks", to: "bookmarks#new"

  # post "bookmarks", to: "bookmarks#create"

  # delete "bookmarks", to: "bookmarks#destroy"

  # get "lists", to: "lists#index"

  # get "lists", to: "lists#new"

  # get "lists", to: "lists#show", as: :movie_id

  # post "lists", to: "lists#create"

  resources :movies
  resources :lists, only: [:index, :new, :create, :show] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end

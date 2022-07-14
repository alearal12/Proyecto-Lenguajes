Rails.application.routes.draw do
  #resources :clients
  resources :orders
  resources :plates
  resources :users

  scope module: :api do
    resources :clients
  end

  #scope module: :api, path: "api" do
  # resources :clients
 # end

  root "sessions#new"
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users, except: [:new]
  get "menu", to: "menu#show"


end

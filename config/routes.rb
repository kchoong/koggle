# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :offices
  resources :workers
  # Root
  root "home#index"

  # Authentication
  devise_for :users

  # Model CRUD

  # GET
  get "/dashboard" => "dashboard#index"
end


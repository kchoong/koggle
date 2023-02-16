# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Root
  root "home#index"

  # Authentication
  devise_for :users

  # Resources
  resources :offices
  resources :shifts
  resources :vacations
  resources :workers

  # GET
  get "/dashboard" => "dashboard#index"
end


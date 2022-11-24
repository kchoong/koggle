Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # Root
  root "home#index"

  # Model CRUD
  resources :users
  resources :groups

  # GET
  get "/dashboard" => "dashboard#index", as: "dashboard"
  get "/calendar/:year/:month" => "calendar#show_month", as: "calendar_month"
end

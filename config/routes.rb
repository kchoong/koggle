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

  # Dashboard
  get "/dashboard" => "dashboard#index"

  # Terminal
  get "/terminal/:id" => "terminal#office", as: :terminal_office
  post "/terminal/:id" => "terminal#check", as: :terminal_office_check
end


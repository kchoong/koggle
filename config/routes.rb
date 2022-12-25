# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  # Root
  root "home#index"

  # Authentication
  devise_for :users

  # Model CRUD
  resources :groups do
    resources :comments, only: [:create, :destroy]
  end
  resources :profiles, only: [:show, :edit] do
    resources :comments, only: [:create, :destroy]
  end
  resources :settings, only: [:show, :edit]

  # GET
  get "/locale/:locale" => "home#switch_locale", as: "switch_locale"
  get "/dashboard" => "dashboard#index", as: "dashboard"
  get "/dashboard/calendar" => "dashboard#calendar", as: "dashboard_calendar"

end

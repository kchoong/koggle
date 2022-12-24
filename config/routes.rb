# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  # Root
  root "home#index"

  # Model CRUD
  resources :persons do
    resources :comments, only: [:create, :destroy]
  end
  resources :organizations do
    resources :comments, only: [:create, :destroy]
  end
  devise_for :users

  # GET
  get "/locale/:locale" => "home#switch_locale", as: "switch_locale"
  get "/dashboard" => "dashboard#index", as: "dashboard"
  get "/dashboard/calendar" => "dashboard#calendar", as: "dashboard_calendar"

end

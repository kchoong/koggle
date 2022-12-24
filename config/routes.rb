Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Root
  root "home#index"

  # Model CRUD
  resources :users do
    resources :comments, only: [:create, :destroy]
  end
  resources :groups do
    resources :comments, only: [:create, :destroy]
  end

  # GET
  get "/locale/:locale" => "home#switch_locale", as: "switch_locale"
  get "/dashboard" => "dashboard#index", as: "dashboard"
  get "/dashboard/calendar" => "dashboard#calendar", as: "dashboard_calendar"

end

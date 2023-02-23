# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Root
  root "home#index"

  # Authentication
  devise_for :users

  # Resources
  resources :offices do
    resources :comments, only: [:create, :destroy]
    get "/report(/:year(/:month(/:day)))" => "report#office"
  end
  resources :shifts do
    resources :comments, only: [:create, :destroy]
  end
  resources :vacations do
    resources :comments, only: [:create, :destroy]
  end
  resources :workers do
    resources :comments, only: [:create, :destroy]
    get "/report(/:year(/:month(/:day)))" => "report#worker"
  end

  # Dashboard
  get "/dashboard" => "dashboard#index"

  # Terminal
  get "/terminal/:id" => "terminal#office", as: :terminal_office
  post "/terminal/:id" => "terminal#check", as: :terminal_office_check
end


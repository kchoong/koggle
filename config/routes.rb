# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Root
  root "home#index"

  # Authentication
  devise_for :users

  # Resources
  resources :offices do
    resources :comments, only: [:create, :destroy]
    get "/report(/:year(/:month(/:day)))(.:format)" => "report#office"
  end
  resources :shifts
  resources :vacations
  resources :workers do
    resources :comments, only: [:create, :destroy]
    get "/report(/:year(/:month(/:day)))(.:format)" => "report#worker"
  end

  # Dashboard
  get "/dashboard" => "dashboard#index"

  # Terminal
  get "/terminal/:id" => "terminal#office", as: :terminal_office
  post "/terminal/:id" => "terminal#check", as: :terminal_office_check

  # Admin
  namespace :admin do
    resources :shift_corrections, only: [:index]
    get "/shift_corrections/edit_shift/:id" => "shift_corrections#edit_shift", as: :edit_shift
    patch "/shift_corrections/update_shift/:id" => "shift_corrections#update_shift", as: :update_shift
  end

end


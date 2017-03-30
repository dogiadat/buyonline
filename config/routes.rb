Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"},
    path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

  root "pages#index"

  devise_for :admins, controllers: {sessions: "admin/sessions", registrations: "admin/registrations"},
    path: "admin", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}
  namespace :admin do
    root "pages#index"
    resources :categories
    resources :restaurant_categories
    resources :food_categories
    resources :restaurants
  end

  resources :restaurants, only: :index

  get "/*page", to: "pages#show"
end

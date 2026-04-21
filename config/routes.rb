Rails.application.routes.draw do
  root "api/v1/recipes#index"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :categories
  resources :recipes   # ✅ ADD THIS
end
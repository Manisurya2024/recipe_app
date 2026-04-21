Rails.application.routes.draw do
  root "api/v1/recipes#index"

  namespace :api do
    namespace :v1 do
      resources :recipes
    end
  end
end
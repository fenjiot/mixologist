Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :recipes do
    resources :recipe_ingredients, only: [:create, :update, :destroy]
  end

  resources :ingredients

  root "recipes#index"
end

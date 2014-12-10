Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :recipes do
    resources :recipe_ingredients, only: [:create, :update, :destroy]
    resources :ratings, only: [:create, :update, :destroy]
  end

  resources :ingredients

  resources :lists do
    resources :list_recipes, only: [:create, :update, :destroy]
  end

  resources :searches, only: [:index]

  root "recipes#index"
end

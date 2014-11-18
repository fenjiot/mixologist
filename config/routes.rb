Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :recipes

  resources :ingredients, only: [:index, :new, :create, :show]

  root "recipes#index"
end

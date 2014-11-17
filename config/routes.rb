Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :recipes, only: [:index, :new, :create]

  root "recipes#index"
end

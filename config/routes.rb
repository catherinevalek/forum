Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :index]

  root to: "home#index"

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end

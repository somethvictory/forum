Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :questions, only: [:new, :edit, :create, :update]
end

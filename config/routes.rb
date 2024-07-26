Rails.application.routes.draw do
  resources :companies
  root 'home#index'

  devise_for :users
end

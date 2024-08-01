Rails.application.routes.draw do
  resources :companies
  get 'my_company', to: 'companies#my_company', as: :my_company

  root 'home#index'

  devise_for :users
end

Rails.application.routes.draw do
  get 'admin/index'
  get 'approve_recruiter/:recruiter_id', to: 'admin#approve_recruiter', as: 'approve_recruiter'
  get 'destroy_recruiter/:recruiter_id', to: 'admin#destroy_recruiter', as: 'destroy_recruiter'
  resources :companies
  get 'my_company', to: 'companies#my_company', as: :my_company

  root 'home#index'

  devise_for :users
end

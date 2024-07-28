Rails.application.routes.draw do
  resources :jobs, shallow: true do
    resources :assessments, shallow: true do
      resources :questions, shallow: true
    end
  end
  root 'home#index'

  devise_for :users
end

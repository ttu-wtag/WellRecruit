Rails.application.routes.draw do
  resources :questions
  #resources :assessments
  resources :jobs do
    resources :assessments
  end
  root 'home#index'
end

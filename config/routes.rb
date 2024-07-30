Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :jobs, shallow: true do
    resources :assessments, shallow: true do
      resources :questions, shallow: true
    end

    resources :applications
  end

  get "my_jobs", to: "jobs#my_jobs", as: "my_jobs"
end

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :jobs, shallow: true do
    resources :assessments, shallow: true do
      resources :questions, shallow: true
    end

    resources :applications do
      member do
        get 'change_status/:status', to: 'applications#change_status', as: 'change_status'
      end

      get 'participation/new', to: 'participation#new', as: 'participation'
    end
  end

  get "my_jobs", to: "jobs#my_jobs", as: "my_jobs"
end

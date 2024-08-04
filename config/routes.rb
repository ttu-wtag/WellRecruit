Rails.application.routes.draw do
  resources :companies
  get 'my_company', to: 'companies#my_company', as: :my_company

  root 'home#index'

  devise_for :users

  resources :jobs, shallow: true do
    resources :assessments, shallow: true do
      resources :questions, shallow: true
    end

    resources :applications, shallow: true do
      member do
        get 'change_status/:status', to: 'applications#change_status', as: 'change_status'
      end
      resources :participations
    end
  end
  get 'candidate_applications', to: 'applications#candidate_applications', as: 'candidate_applications'

  get "my_jobs", to: "jobs#my_jobs", as: "my_jobs"
end

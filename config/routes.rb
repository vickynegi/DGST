Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'employees#index'

  resources :employees, only: [:index, :create] do
    collection do
      post :offering_out
      post :notify
    end
  end

  resources :blind_dates, only: [:index, :create] do
    member do
      patch :assign_leader
    end
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :teams do
    resources :projects, only: [:index, :new, :create]
    resources :events, only: :index do
      collection do
        get :load
      end
    end
  end

  resources :projects, only: :show do
    resources :todolists
    resources :todos do
      resources :comments
      member do
        get :finish
        get :open
        get :restore
      end
    end
  end
end

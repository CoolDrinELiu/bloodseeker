Rails.application.routes.draw do
  root 'coins#index'

  resources :coins, only: [:index] do
    collection do
      get :stare
    end
  end
end

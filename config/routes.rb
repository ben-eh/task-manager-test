Rails.application.routes.draw do
  devise_for :users
  # get 'complete', to: 'tasks#complete'
  resources :tasks do
    member do
      get 'complete', 'prioritize', 'reactivate', 'demote'
    end
    collection do
      get 'remove_old'
    end
  end
  root to: 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

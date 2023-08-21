Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: [] do
    resources :recipes, only: [:index, :show]
  end
end

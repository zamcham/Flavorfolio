Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: [] do
    resources :recipes, only: [:new, :create, :index, :show]
  end
end

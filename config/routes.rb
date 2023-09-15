Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: [] do
    resources :recipes, only: [:new, :create, :index, :show, :destroy]
    resources :ingredients, controller: 'ingredients_ownership', only: [:index, :show, :edit, :update, :destroy]
    member do
      post 'toggle_visibility'
    end
  end
end

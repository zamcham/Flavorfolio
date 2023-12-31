Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: [] do
    resources :recipes, only: [:new, :create, :index, :show, :destroy] do
      member do
        post 'toggle_visibility'
      end
    end

    resources :ingredients, controller: 'ingredients_ownership', only: [:index, :new, :edit, :update, :destroy, :create]
  end
end

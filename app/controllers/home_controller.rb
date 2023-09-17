class HomeController < ApplicationController
  def index
    @publicRecipes = Recipe.where(public: true).order(created_at: :desc)
  end
end

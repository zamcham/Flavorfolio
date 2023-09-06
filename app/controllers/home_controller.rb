class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @publicRecipes = Recipe.where(public: true)
  end
end

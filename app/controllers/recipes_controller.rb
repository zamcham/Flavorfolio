class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end
  
  def show
    user_id = params[:user_id]
    recipe_id = params[:id]

    @recipe = Recipe.find_by(id: recipe_id, user_id: user_id)
    @user = User.find_by(id: user_id)

    if @recipe.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
    else
      render 'show'
    end
  end
end

class IngredientsOwnershipController < ApplicationController
    def index
        user_id = params[:user_id]
        @ingredients_owned = IngredientOwnership.where(user_id: user_id)
    end

    def new
        @ingredient_ownership = IngredientOwnership.new
        @ingredients = Ingredient.all
    end

    def create
        @ingredient_ownership = IngredientOwnership.new(ingredient_ownership_params)
        @ingredient_ownership.user = current_user
    
        if @ingredient_ownership.save
          redirect_to user_ingredients_path(current_user), notice: 'Ingredient added to your stock successfully.'
        else
          @ingredients = Ingredient.all
          render 'new'
        end
    end

    private

    def ingredient_ownership_params
        params.require(:ingredient_ownership).permit(:ingredient_id, :user_quantity)
    end
end

class IngredientsOwnershipController < ApplicationController
    def index
        user_id = params[:user_id]
        @ingredients = IngredientOwnership.where(user_id: user_id)
    end

    def new
        @ingredient_ownership = current_user.ingredient_ownerships.build
        @ingredients = Ingredient.all
    end
end

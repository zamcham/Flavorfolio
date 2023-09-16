class IngredientsOwnershipController < ApplicationController
    def index
        user_id = params[:user_id]
        @ingredients = IngredientOwnership.where(user_id: user_id)
    end

    def new
        @ingredient_ownership = current_user.ingredient_ownerships.build
        @ingredients = Ingredient.all
    end

    def create
        @ingredient_ownership = current_user.ingredient_ownerships.build(ingredient_ownership_params)
    
        if @ingredient_ownership.save
          # Handle successful creation, e.g., redirect or respond with JSON
        else
          puts @ingredient_ownership.errors.full_messages
        end
    end

    private

    def ingredient_ownership_params
        params.require(:ingredient_ownership).permit(:ingredient_id, :user_quantity)
    end
end

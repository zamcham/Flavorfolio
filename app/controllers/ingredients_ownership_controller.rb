class IngredientsOwnershipController < ApplicationController
    def index
        user_id = params[:user_id]
        @ingredients = IngredientOwnership.where(user_id: user_id)
    end
end

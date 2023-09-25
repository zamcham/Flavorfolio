class Ingredient < ApplicationRecord
    has_many :ingredient_ownerships
    has_many :users, through: :ingredient_ownerships
    has_and_belongs_to_many :recipes
end
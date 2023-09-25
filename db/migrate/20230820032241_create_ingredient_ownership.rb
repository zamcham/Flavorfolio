class CreateIngredientOwnership < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_ownerships do |t|
      t.references :user, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.decimal :quantity, precision: 10, scale: 2

      t.timestamps
    end
  end
end

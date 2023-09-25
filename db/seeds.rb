# Create users
user_one = User.create!(name: 'Naan', email: '123email@gmail.com', password: '123456', photo: 'defaultUser.jpg')
user_two = User.create!(name: 'Cristian', email: '456email@gmail.com', password: '123456', photo: 'defaultUser.jpg')

# Create ingredients
ingredient_one = Ingredient.create!(name: 'Pepper', measurement_unit: 'g', price: 0.99)
ingredient_two = Ingredient.create!(name: 'Salt', measurement_unit: 'lb', price: 0.50)
ingredient_three = Ingredient.create!(name: 'Chicken Breast', measurement_unit: 'lb', price: 1)
ingredient_four = Ingredient.create!(name: 'BBQ Sauce', measurement_unit: 'oz', price: 2.50)  # Create BBQ Sauce
ingredient_five = Ingredient.create!(name: 'Orange Juice', measurement_unit: 'ml', price: 1.75)  # Create Orange Juice
ingredient_six = Ingredient.create!(name: 'Soy Sauce', measurement_unit: 'oz', price: 1.25)  # Create Soy Sauce
ingredient_seven = Ingredient.create!(name: 'Chicken Legs', measurement_unit: 'lb', price: 2.00)  # Create Chicken Legs

# Create recipes
recipe_one = user_one.recipes.create!(
  name: 'Pulled BBQ chicken',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  preparation_time: 35,
  cooking_time: 15,
  public: true,
  photo: 'defaultRecipe.jpg'
)

recipe_two = user_two.recipes.create!(
  name: 'Orange chicken',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquam nulla facilisi cras fermentum. Nunc sed id semper risus in.',
  preparation_time: 35,
  cooking_time: 15,
  public: true,
  photo: 'defaultRecipe.jpg'
)

# Associate ingredients with recipes using the join table
RecipeIngredient.create(recipe: recipe_one, ingredient: ingredient_four)
RecipeIngredient.create(recipe: recipe_one, ingredient: ingredient_seven)
RecipeIngredient.create(recipe: recipe_two, ingredient: ingredient_five)
RecipeIngredient.create(recipe: recipe_two, ingredient: ingredient_six)

# Ingredient ownerships
ownership1 = IngredientOwnership.create(user: user_one, ingredient: ingredient_one, quantity: 50)
ownership2 = IngredientOwnership.create(user: user_two, ingredient: ingredient_two, quantity: 5)
ownership3 = IngredientOwnership.create(user: user_two, ingredient: ingredient_three, quantity: 1)
ownership4 = IngredientOwnership.create(user: user_one, ingredient: ingredient_seven, quantity: 2) 
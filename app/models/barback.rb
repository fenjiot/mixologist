class Barback
  def initialize(list)
    @list = list
  end

  def recipes
    @list.list_recipes.order("quantity DESC")
  end

  def recipes_to_add
    recipes_available.where.not(id: recipes_added)
  end

  def ingredients_in_recipes
    aggregate_ingredient_list(list_of_ingredients)
  end

  private

  def list_of_ingredients
    all_the_ingredients = []
    @list.list_recipes.each do |list_recipe|
      quantity = list_recipe.quantity
      list_recipe.recipe.recipe_ingredients.each do |recipe_ingredient|
        ingredient_amount = quantity * recipe_ingredient.amount_to_show
        hash = { recipe_ingredient.ingredient => ingredient_amount }
        all_the_ingredients << hash
      end
    end
    all_the_ingredients.sort_by { |_ingredient, amount| amount }.reverse
  end

  def aggregate_ingredient_list(all_the_ingredients)
    all_the_ingredients.inject do |list_of_ingredients_and_amounts, ingredient|
      list = list_of_ingredients_and_amounts
      list.merge(ingredient) do |_ingredient, current_amount, additional_amount|
        current_amount + additional_amount
      end
    end
  end

  def recipes_available
    Recipe.order("name")
  end

  def recipes_added
    @list.recipes
  end
end

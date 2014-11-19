class Bartender
  def initialize(recipe)
    @recipe = recipe
  end

  def all_ingredients
    Ingredient.all.order("name")
  end

  def ingredients_used
    @recipe.ingredients
  end

  def unused_ingredients
    all_ingredients - ingredients_used
  end
end

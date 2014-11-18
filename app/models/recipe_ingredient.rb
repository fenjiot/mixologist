class RecipeIngredient < ActiveRecord::Base
  validates :ingredient_is_not_already_in_recipe

  private

  def ingredient_is_not_already_in_recipe
    if recipe_ingredient_id == RecipeIngredient.find_by(:ingredient_id)
      erros.add(:base, "Ingredient is already in recipe")
    end
  end
end

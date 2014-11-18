class RecipeIngredient < ActiveRecord::Base
  UNIT_OF_MEASURE = %W[ ml oz dash tsp tbsp shot cup nip #{"half pint"} #{"pint (US)"} #{"pint (UK)"} tenth fifth qt gallon ]

  belongs_to :recipe
  belongs_to :ingredient

  private

  def valid_uom
    unless UNIT_OF_MEASURE.include?(uom)
      errors.add(:uom, "Unit Of Measure must be one of the predefined UOM")
    end
  end

  # def ingredient_is_not_already_in_recipe
  #   if recipe_ingredient_id == RecipeIngredient.find_by(:ingredient_id)
  #     errors.add(:base, "Ingredient already added to recipe")
  #   end
  # end
end

class Jigger
  BASE_UNIT_OF_MEASURE = "fluid-ounces"

  def convert_to_show(recipe_ingredient)
    quantity = recipe_ingredient.quantity
    unit_of_measure = recipe_ingredient.unit_of_measure

    amount = Unit(quantity.to_s + BASE_UNIT_OF_MEASURE)
    amount.convert_to(unit_of_measure)
  end

  def convert_to_base_units(quantity, unit_of_measure)
    if quantity.present?
      amount = Unit(quantity.to_s + unit_of_measure)
      amount = amount.convert_to(BASE_UNIT_OF_MEASURE)
      amount.scalar
    else
      nil
    end
  end
end

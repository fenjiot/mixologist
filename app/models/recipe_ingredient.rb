class RecipeIngredient < ActiveRecord::Base
  UNIT_OF_MEASURE = [
    "milliliter",
    "fluid-ounce",
    "teaspoon",
    "tablespoon",
    "cup",
    "pint",
    "quart",
    "gallon",
  ]

  validates :qty, presence: true
  validates :unit_of_measure, presence: true

  belongs_to :recipe
  belongs_to :ingredient
  delegate :name, to: :ingredient

  def self.valid_units_of_measure
    UNIT_OF_MEASURE.sort
  end
end

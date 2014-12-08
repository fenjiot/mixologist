class RecipeIngredient < ActiveRecord::Base
  UNIT_OF_MEASURE = [
    "fluid-ounce",
    "cup",
    "gallon",
    "milliliter",
    "pint",
    "quart",
    "tablespoon",
    "teaspoon",
  ]

  validates :quantity, presence: true
  validates :unit_of_measure, presence: true

  belongs_to :recipe
  belongs_to :ingredient
  delegate :name, to: :ingredient

  def self.valid_units_of_measure
    UNIT_OF_MEASURE
  end

  def amount_to_show
    Jigger.new.convert_to_show(self)
  end
end

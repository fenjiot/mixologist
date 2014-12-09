class RecipeIngredient < ActiveRecord::Base
  UNITS_OF_MEASURE = [
    "cup",
    "dash",
    "fifth",
    "fluid-ounce",
    "gallon",
    "half-gallon",
    "half-pint",
    "jigger",
    "measure",
    "mickey",
    "milliliter",
    "nip",
    "pint",
    "pony",
    "quart",
    "shot",
    "splash",
    "split",
    "tablespoon",
    "teaspoon",
    "tenth",
  ]

  validates :quantity, presence: true
  validates :unit_of_measure, presence: true

  belongs_to :recipe
  belongs_to :ingredient
  delegate :name, to: :ingredient

  def self.valid_units_of_measure
    UNITS_OF_MEASURE
  end

  def amount_to_show
    Jigger.new.convert_to_show(self)
  end
end

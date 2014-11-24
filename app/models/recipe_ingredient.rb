class RecipeIngredient < ActiveRecord::Base
  UNIT_OF_MEASURE = [ "ml",
                      "oz",
                      "dash",
                      "tsp",
                      "tbsp",
                      "shot",
                      "cup",
                      "nip",
                      "#{"half pint"}",
                      "#{"pint (US)"}",
                      "tenth",
                      "fifth",
                      "qt",
                      "gallon",
                      "part",
                    ]

  validates :qty, presence: true
  validates :uom, presence: true

  belongs_to :recipe
  belongs_to :ingredient
  delegate :name, to: :ingredient

  def self.valid_uom
    UNIT_OF_MEASURE.sort
  end

  def used_ingredients
    recipe.ingredients
  end
end

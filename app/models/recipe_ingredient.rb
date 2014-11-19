class RecipeIngredient < ActiveRecord::Base
  UNIT_OF_MEASURE = %W[ ml
                        oz
                        dash
                        tsp
                        tbsp
                        shot
                        cup
                        nip
                        #{"half pint"}
                        #{"pint (US)"}
                        #{"pint (UK)"}
                        tenth
                        fifth
                        qt
                        gallon
                        part
                    ]

  validates :qty, presence: true

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

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
  ]

  belongs_to :recipe
  belongs_to :ingredient
  delegate :name, to: :ingredient

  def self.valid_uom
    UNIT_OF_MEASURE
  end
end

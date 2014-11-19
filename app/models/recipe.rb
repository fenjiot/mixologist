class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :instructions, presence: true

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
end

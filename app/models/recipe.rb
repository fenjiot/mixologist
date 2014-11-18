class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :instructions, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def available_ingredients
    Ingredient.all.order("name")
  end

  def add_ingredient(ingredient)
    recipe_ingredients << ingredient
  end

  def remove_ingredient(ingredient)
    recipie_ingredients.destroy(ingredient)
  end
end

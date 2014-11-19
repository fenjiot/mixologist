class Ingredient < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipes_ingredients

  def self.available
    all.order("name")
  end
end

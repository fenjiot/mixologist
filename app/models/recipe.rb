class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :instructions, presence: true
  validates :serves, presence: true

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  belongs_to :user

  has_many :ratings,
    foreign_key: :rated_recipe_id,
    class_name: "Rating",
    dependent: :destroy
  has_many :raters, through: :ratings

  has_many :list_recipes
  has_many :lists, through: :list_recipes

  def owned_by?(potential_owner)
    user == potential_owner
  end

  def rated_by?(potential_user)
    ratings.find_by(rater_id: potential_user)
  end

  def average_rating
    if ratings.present?
      (total_value_of_ratings / number_of_ratings.to_f)
    end
  end

  private

  def total_value_of_ratings
    ratings.sum(:value)
  end

  def number_of_ratings
    ratings.size
  end
end

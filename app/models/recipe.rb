class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :instructions, presence: true

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  belongs_to :user

  has_many :ratings,
           foreign_key: :rated_recipe_id,
           class_name: "Rating",
           dependent: :destroy
  has_many :raters, through: :ratings

  def owned_by?(potential_owner)
    user == potential_owner
  end

  def rated_by?(potential_user)
    ratings.find_by_rater_id(potential_user)
  end

  def average_rating
    total_value_of_ratings.to_f / number_of_ratings.to_f
  end

  private

  def total_value_of_ratings
    value = 0
    ratings.each { |rating| value += rating.value }
    value
  end

  def number_of_ratings
    ratings.count
  end
end

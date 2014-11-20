class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :instructions, presence: true

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  belongs_to :user

  has_many :recipe_likes,
           foreign_key: :liked_recipe_id,
           class_name: "RecipeLike",
           dependent: :destroy
  has_many :likers, through: :recipe_likes

  def owned_by?(potential_owner)
    user == potential_owner
  end

  def rated_by?(potential_user)
    recipe_likes.find_by_liker_id(potential_user)
  end
end

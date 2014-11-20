class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :recipes

  has_many :recipe_likes,
    foreign_key: :liker_id,
    class_name: "RecipeLike",
    dependent: :destroy
  has_many :liked_recipes, through: :recipe_likes
end

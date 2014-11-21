class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :recipes

  has_many :ratings,
           foreign_key: :rater_id,
           class_name: "Rating",
           dependent: :destroy
  has_many :rated_recipes, through: :ratings
end

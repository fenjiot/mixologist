class List < ActiveRecord::Base
  validates :name, presence: true
  validates :serves, presence: true

  belongs_to :user

  has_many :list_recipes
  has_many :recipes, through: :list_recipes

  def owned_by?(potential_owner)
    user == potential_owner
  end
end

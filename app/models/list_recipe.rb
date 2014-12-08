class ListRecipe < ActiveRecord::Base
  validates :qty, presence: true

  belongs_to :list
  belongs_to :recipe
  delegate :name, to: :recipe
end

class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :instructions, presence: true
end

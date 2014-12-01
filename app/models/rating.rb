class Rating < ActiveRecord::Base
  VALUES = [[1, "."], [2, "."], [3, "."], [4, "."], [5, "."]]

  belongs_to :rater, class_name: "User"
  belongs_to :rated_recipe, class_name: "Recipe"
end

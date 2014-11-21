class Rating < ActiveRecord::Base
  belongs_to :rater, class_name: "User"
  belongs_to :rated_recipe, class_name: "Recipe"
end

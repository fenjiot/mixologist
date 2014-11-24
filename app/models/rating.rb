class Rating < ActiveRecord::Base
  VALUES = [[1, "1"],[2,"2"],[3,"Meh"],[4,"4"],[5,"5"]]

  belongs_to :rater, class_name: "User"
  belongs_to :rated_recipe, class_name: "Recipe"
end

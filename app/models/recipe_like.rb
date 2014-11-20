class RecipeLike < ActiveRecord::Base
  belongs_to :liker, class_name: "User"
  belongs_to :liked_recipe, class_name: "Recipe"
end

module RatingHelper
  def recipe_ballot(recipe)
    if rating = current_user.recipe_likes.find_by_liked_recipe_id(recipe)
      rating
    else
      current_user.recipe_likes.new
    end
  end
end

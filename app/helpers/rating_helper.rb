module RatingHelper
  def recipe_ballot(recipe)
    if rating = current_user.ratings.find_by_rated_recipe_id(recipe)
      rating
    else
      current_user.ratings.new
    end
  end
end

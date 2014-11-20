module RatingHelper
  def recipe_ballot(recipe)
    if rating = current_user.ratings.find_by(rated_recipe: recipe)
      rating
    else
      current_user.ratings.new
    end
  end
end

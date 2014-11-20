class RatingsController < ApplicationController
  def create
    Rating.create(rating_params)

    recipe = load_recipe_from_url
    redirect_to recipe
  end

  def update
    rating = load_rating_from_url
    rating.update(rating_params)

    recipe = load_recipe_from_url
    redirect_to recipe
  end

  def destroy
    rating = load_rating_from_url
    rating.destroy

    recipe = load_recipe_from_url
    redirect_to recipe
  end

  private

  def rating_params
    params.require(:rating).
      permit(:value).
      merge(
        rated_recipe_id: params[:recipe_id],
        rater_id: current_user.id,
      )
  end

  def load_rating_from_url
    Rating.find(params[:id])
  end

  def load_recipe_from_url
    Recipe.find(params[:recipe_id])
  end
end

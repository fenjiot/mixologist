class RatingsController < ApplicationController
  def create
    Rating.create(rating_params)

    redirect_to :back
  end

  def update
    rating = load_recipe_like_from_url
    rating.update(rating_params)

    redirect_to :back
  end

  def destroy
    rating = load_recipe_like_from_url
    rating.destroy

    redirect_to :back
  end

  private

  def rating_params
    params.require(:rating).
      permit(:value).
      merge(rated_recipe_id: params[:recipe_id],
            rater_id: current_user.id,
           )
  end

  def load_recipe_like_from_url
    Rating.find(params[:id])
  end
end

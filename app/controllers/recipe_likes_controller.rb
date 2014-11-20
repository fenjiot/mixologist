class RecipeLikesController < ApplicationController
  def create
    RecipeLike.create(recipe_like_params)

    redirect_to :back
  end

  def update
    recipe_like = load_recipe_like_from_url
    recipe_like.update(recipe_like_params)

    redirect_to :back
  end

  def destroy
    recipe_like = load_recipe_like_from_url
    recipe_like.destroy

    redirect_to :back
  end

  private

  def recipe_like_params
    params.require(:recipe_like).
      permit(:rating).
      merge(liked_recipe_id: params[:recipe_id],
            liker_id: current_user.id,
           )
  end

  def load_recipe_like_from_url
    RecipeLike.find(params[:id])
  end
end

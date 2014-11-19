class RecipeIngredientsController < ApplicationController
  def create
    recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    recipe_ingredient.save

    redirect_to :back
  end

  def update
    recipe_ingredient = RecipeIngredient.find(params[:id])
    recipe_ingredient.update(recipe_ingredient_params)

    redirect_to :back
  end

  def destroy
    ingredient_to_remove = ingredient_of_concern
    recipe.remove_ingredient(ingredient_to_remove)

    redirect_to :back
  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredient).
      permit(:ingredient_id, :qty, :uom).
      merge(recipe_id: params[:recipe_id])
  end

  def load_recipe_from_url
    Recipe.find(params[:recipe_id])
  end
end

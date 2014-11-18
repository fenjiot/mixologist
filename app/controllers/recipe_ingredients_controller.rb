class RecipeIngredientsController < ApplicationController
  def new
  end

  def create
    binding.pry
    # ingredient_to_add = ingredient_of_concern
    # recipe = load_recipe_from_url
    # recipe.add_ingredient(ingredient_to_add)

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
      permit(:ingredient_id)
  end

  def load_recipe_from_url
    Recipe.find(params[:recipe_id])
  end

  def ingredient_of_concern
    recipe_ingredient = RecipeIngredient.find_by(recipe_id: params[:recipe_id])
    recipe_ingredient.ingredient
  end
end

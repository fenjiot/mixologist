class RecipeIngredientsController < ApplicationController
  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)

    unless @recipe_ingredient.save
      flash[:notice] = "Quantity can't be blank"
    end

    redirect_to :back
  end

  def update
    recipe_ingredient = load_recipe_ingredient_from_url
    recipe_ingredient.update(recipe_ingredient_params)

    redirect_to :back
  end

  def destroy
    recipe_ingredient = load_recipe_ingredient_from_url
    recipe_ingredient.destroy

    redirect_to :back
  end

  private

  def quantity_in_base_units
    Jigger.new.convert_to_base_units(
      params[:recipe_ingredient][:quantity],
      params[:recipe_ingredient][:unit_of_measure]
    )
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).
      permit(:ingredient_id, :quantity, :unit_of_measure).
      merge(
        recipe_id: params[:recipe_id],
        quantity: quantity_in_base_units
      )
  end

  def load_recipe_ingredient_from_url
    RecipeIngredient.find(params[:id])
  end

  def load_recipe_from_url
    Recipe.find(params[:recipe_id])
  end
end

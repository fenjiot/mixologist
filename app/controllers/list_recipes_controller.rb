class ListRecipesController < ApplicationController
  def create
    @list_recipe = ListRecipe.new(list_recipe_params)

    unless @list_recipe.save
      flash[:notice] = "Quantity can't be blank"
    end

    redirect_to @list_recipe.list
  end

  def update
    list_recipe = load_list_recipe_from_url
    list_recipe.update(list_recipe_params)

    redirect_to list_recipe.list
  end

  def destroy
    list = load_list_from_url
    list_recipe = load_list_recipe_from_url
    list_recipe.destroy

    redirect_to list
  end

  private

  def list_recipe_params
    params.require(:list_recipe).
      permit(:recipe_id, :quantity).
      merge(list_id: params[:list_id])
  end

  def load_list_recipe_from_url
    ListRecipe.find(params[:id])
  end

  def load_list_from_url
    List.find(params[:list_id])
  end
end

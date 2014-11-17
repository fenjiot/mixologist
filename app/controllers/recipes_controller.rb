class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    @recipe = load_recipe_from_url
  end

  def edit
    @recipe = load_recipe_from_url
  end

  def update
    @recipe = load_recipe_from_url
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).
      permit(:name, :instructions)
  end

  def load_recipe_from_url
    Recipe.find(params[:id])
  end
end

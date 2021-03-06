class RecipesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @recipes = Recipe.all.order("name")
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe = load_recipe_from_url
  end

  def edit
    @recipe = load_recipe_from_url
    @bartender = Bartender.new(@recipe)
  end

  def update
    @recipe = load_recipe_from_url

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    recipe = load_recipe_from_url
    recipe.destroy

    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).
      permit(:name, :instructions, :serves).
      merge(user_id: current_user.id)
  end

  def load_recipe_from_url
    Recipe.find(params[:id])
  end
end

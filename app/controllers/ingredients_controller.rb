class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def show
    @ingredient = load_ingredient_from_url
  end

  private

  def ingredient_params
    params.require(:ingredient).
      permit(:name, :description)
  end

  def load_ingredient_from_url
    Ingredient.find(params[:id])
  end
end

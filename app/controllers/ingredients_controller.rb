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
      redirect_to :back
    else
      render :new
    end
  end

  def show
    @ingredient = load_ingredient_from_url
  end

  def edit
    @ingredient = load_ingredient_from_url
  end

  def update
    @ingredient = load_ingredient_from_url

    if @ingredient.update(ingredient_params)
      redirect_to @ingredient
    else
      render :edit
    end
  end

  def destroy
    ingredient = load_ingredient_from_url
    ingredient.destroy

    redirect_to ingredients_path
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

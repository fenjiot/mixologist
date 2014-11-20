class UserRecipesController < ApplicationController
  def create
    binding.pry
    user_recipe = UserRecipe.new(user_recipe_params)
    # if user_recipe.save
    #   redirect_to user_recipe.recipe
    # end
    redirect_to :back
  end
end

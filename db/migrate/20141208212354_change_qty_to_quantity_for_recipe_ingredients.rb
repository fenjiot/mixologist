class ChangeQtyToQuantityForRecipeIngredients < ActiveRecord::Migration
  def change
    rename_column :recipe_ingredients, :qty, :quantity
  end
end

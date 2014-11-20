class ChangeRecipeIngredientsQtyToFloat < ActiveRecord::Migration
  def up
    change_column :recipe_ingredients, :qty, :float
  end

  def down
    change_column :recipe_ingredients, :qty, :integer
  end
end

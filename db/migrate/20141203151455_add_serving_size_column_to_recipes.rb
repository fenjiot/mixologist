class AddServingSizeColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :serves, :integer, null: false
  end
end

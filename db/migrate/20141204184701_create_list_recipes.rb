class CreateListRecipes < ActiveRecord::Migration
  def change
    create_table :list_recipes do |t|
      t.integer :list_id, null: false
      t.integer :recipe_id, null: false
      t.integer :qty, null: false

      t.timestamps null: false
    end

    add_index :list_recipes, :list_id
    add_index :list_recipes, :recipe_id

    add_index :list_recipes, [:list_id, :recipe_id], unique: true
  end
end

class CreateRecipeLikes < ActiveRecord::Migration
  def change
    create_table :recipe_likes do |t|
      t.integer :liker_id, null: false
      t.integer :liked_recipe_id, null: false
      t.integer :rating

      t.timestamps null: false
    end

    add_index :recipe_likes, :liker_id
    add_index :recipe_likes, :liked_recipe_id

    add_index :recipe_likes, [:liker_id, :liked_recipe_id], unique: true
  end
end

class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rater_id, null: false
      t.integer :rated_recipe_id, null: false
      t.integer :value, null: false

      t.timestamps null: false
    end

    add_index :ratings, :rater_id
    add_index :ratings, :rated_recipe_id

    add_index :ratings, [:rater_id, :rated_recipe_id], unique: true
  end
end

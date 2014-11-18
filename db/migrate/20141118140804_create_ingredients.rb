class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end

    add_index :ingredients, :name, unique: true
  end
end

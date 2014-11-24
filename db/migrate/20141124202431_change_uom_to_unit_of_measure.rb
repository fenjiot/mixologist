class ChangeUomToUnitOfMeasure < ActiveRecord::Migration
  def change
    rename_column :recipe_ingredients, :uom, :unit_of_measure
  end
end

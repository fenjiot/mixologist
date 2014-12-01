class AddGinIndexesToRecipesColumns < ActiveRecord::Migration
  def up
    execute "CREATE INDEX index_recipes_on_name
      ON recipes
      USING gin(to_tsvector('english', name))"

    execute "CREATE INDEX index_recipes_on_instructions
      ON recipes
      USING gin(to_tsvector('english', instructions))"
  end

  def down
    execute "DROP INDEX index_recipes_on_name"

    execute "DROP INDEX index_recipes_on_instructions"
  end
end

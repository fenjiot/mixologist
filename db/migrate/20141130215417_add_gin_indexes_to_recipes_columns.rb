class AddGinIndexesToRecipesColumns < ActiveRecord::Migration
  def up
    execute "CREATE INDEX index_recipes_on_name
      ON recipes
      USING gin(setweight(to_tsvector('english', name), 'A'))"

    execute "CREATE INDEX index_recipes_on_instructions
      ON recipes
      USING gin(setweight(to_tsvector('english', instructions), 'B'))"
  end

  def down
    execute "DROP INDEX index_recipes_on_name"

    execute "DROP INDEX index_recipes_on_instructions"
  end
end

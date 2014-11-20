class AssociateRecipesToUsers < ActiveRecord::Migration
  def up
    add_column :recipes, :user_id, :integer

    user = select_one "SELECT id FROM users LIMIT 1"
    update "UPDATE recipes SET user_id = #{user["id"]}"

    change_column_null :recipes, :user_id, false
  end

  def down
    remove_column :recipes, :user_id
  end
end

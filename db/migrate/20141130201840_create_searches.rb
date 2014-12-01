class CreateSearches < ActiveRecord::Migration
  def change
    create_view :searches
  end
end

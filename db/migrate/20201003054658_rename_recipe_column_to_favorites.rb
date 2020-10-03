class RenameRecipeColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :recipe, :recipe_id
  end
end

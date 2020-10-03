class CreateRecipeGenreRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_genre_relations do |t|
      t.integer :recipe_id
      t.integer :genre_id

      t.timestamps
    end
  end
end

class RecipeGenreRelation < ApplicationRecord
  belongs_to :recipe
  belongs_to :genre
end

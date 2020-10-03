class Recipe < ApplicationRecord
	belongs_to :user
	attachment :image
    has_many :recipe_genre_relations
    has_many :genres, through: :genres
end

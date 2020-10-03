class Genre < ApplicationRecord
	has_many :recipe_genre_relations
	has_many :recipes, through: :genres
end

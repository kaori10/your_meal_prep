class Recipe < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :reviews, dependent: :destroy
	attachment :image
    has_many :recipe_genre_relations
    has_many :genres, through: :recipe_genre_relations
end

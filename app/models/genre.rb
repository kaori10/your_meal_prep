class Genre < ApplicationRecord
	has_many :recipe_genre_relations
	has_many :recipes, through: :recipe_genre_relations
	validates :name, presence: true, uniqueness: true
	scope :only_active, -> { where(is_active: true) }
end

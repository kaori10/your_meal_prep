class Recipe < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :reviews, dependent: :destroy
    has_many :recipe_genre_relations
    has_many :genres, through: :recipe_genre_relations
	attachment :image

	validates :title, presence: true
	validates :ingredient, presence: true
	validates :body, presence: true

	scope :where_genre_active, -> { joins(:genre).where(genres: { is_active: true }) }

	def avg_score
		unless self.reviews.empty?
			reviews.average(:score).round(1).to_f
		else
			0.0
		end
	end
	def review_score_percentage
		unless self.reviews.empty?
			reviews.average(:score).round(1).to_f*100/5
		else
			0.0
		end
	end

end

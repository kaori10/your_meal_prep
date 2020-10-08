class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :score, presence: true
  validates :content, presence: true
end

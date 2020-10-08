class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :profile, presence: true
  validates :email, presence: true, uniqueness: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end
end

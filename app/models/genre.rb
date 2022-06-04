class Genre < ApplicationRecord
  has_many :circle_genres, dependent: :destroy
  has_many :circles, through: :circle_genres, dependent: :destroy
end

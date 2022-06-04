class CircleGenre < ApplicationRecord
  belongs_to :circle
  belongs_to :genre

  has_many :circles, dependent: :destroy
end

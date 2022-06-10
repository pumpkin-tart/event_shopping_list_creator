class Event < ApplicationRecord
  mount_uploader :map_image, MapImageUploader
  belongs_to :user
  has_many :circles, dependent: :destroy
  accepts_nested_attributes_for :circles

  validates :title, presence: true, length: { maximum: 255 }
end

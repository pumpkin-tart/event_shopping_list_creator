class Event < ApplicationRecord
  mount_uploader :map_image, MapImageUploader
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
end

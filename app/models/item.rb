class Item < ApplicationRecord
  mount_uploader :item_image, ItemImageUploader
  belongs_to :circle

  validates :item_name, presence: true, length: { maximum: 255 }
end

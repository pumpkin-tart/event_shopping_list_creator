class Circle < ApplicationRecord
  mount_uploader :circle_image, CircleImageUploader
  belongs_to :event
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items

  validates :circle_name, presence: true, length: { maximum: 255 }
end

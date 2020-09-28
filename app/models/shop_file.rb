class ShopFile < ApplicationRecord
  belongs_to :shop
  mount_uploader :file, ImageUploader
end

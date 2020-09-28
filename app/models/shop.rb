class Shop < ApplicationRecord
  has_many :shop_files, dependent: :destroy
  accepts_nested_attributes_for :shop_files
  
  # mount_uploader :image, ImageUploader
  # mount_uploaders :imgs, ImageUploader
end

class Image < ApplicationRecord
  has_one_attached :image

  belongs_to :Imageable, polymorphic: true


  def self.ransackable_attributes(auth_object = nil)
    ["Imageable_id", "Imageable_type", "created_at", "id", "image", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["Imageable", "image_attachment", "image_blob"]
  end
end

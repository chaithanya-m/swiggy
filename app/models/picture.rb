class Picture < ApplicationRecord
  has_one_attached :image

  belongs_to :imageable, polymorphic: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "image", "imageable_id", "imageable_type", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "imageable"]
  end

  # def self.ransackable_attributes(auth_object = nil)
  #   ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
  # end

  
end

class Picture < ActiveStorage::Attachment
  has_one_attached :image
  belongs_to :imageable, polymorphic: true

  def self.ransackable_associations(auth_object = nil)
    ["blob", "image_attachment", "image_blob", "imageable", "record"]
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
  end
end

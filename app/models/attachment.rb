class ActiveStorage::Attachment < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    ["blob_id", "created_at", "id"]
  end
end

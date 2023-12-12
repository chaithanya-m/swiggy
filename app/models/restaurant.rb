class Restaurant < ApplicationRecord
  has_many :addresses, as: :addressable
  has_many :food_items
  has_one  :picture, as: :imageable

  
  def self.ransackable_attributes(auth_object = nil)
    ["area", "created_at", "id", "name", "spaciality", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["addresses"]
  end
  


end

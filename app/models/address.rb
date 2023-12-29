class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  def self.ransackable_attributes(auth_object = nil)
    ["addressable_id", "addressable_type", "city", "created_at", "door_number", "id", "state", "street_area", "updated_at", "zipcode"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["addressable", "orders"]
  end
  scope :locations, -> {where(addressable_type: 'Restaurant').pluck(:street_area).uniq }

  has_many :orders
end

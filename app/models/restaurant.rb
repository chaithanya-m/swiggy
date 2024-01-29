class Restaurant < ApplicationRecord
  has_one :address, as: :addressable
  has_many :food_items
  has_one  :picture, as: :imageable

  
  def self.ransackable_attributes(auth_object = nil)
    ["area", "created_at", "id", "name", "spaciality", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["addresses"]
  end
  def self.ransackable_attributes(auth_object = nil)
    super + ['address_id']
  end

  scope :by_street_area, ->(location) { joins(:address).where(address: { street_area: location }).distinct }
  scope :price_range, ->(min_price, max_price) { joins(:food_items).where('food_items.price >= ? AND food_items.price <= ?', min_price, max_price) }
  scope :below_price, ->(max_price) { joins(:food_items).where('food_items.price <= ?', max_price).distinct }
  scope :newest_first, -> { order(created_at: :desc) }
  

end

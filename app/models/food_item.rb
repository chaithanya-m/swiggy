class FoodItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category
  has_many :cart_items

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "name", "price", "restaurant_id", "type", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["cart_items", "category", "restaurant"]
  end

end

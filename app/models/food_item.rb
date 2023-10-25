class FoodItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "name", "price", "restaurant_id", "type", "updated_at"]
  end

end

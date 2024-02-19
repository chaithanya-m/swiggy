class FoodItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category
  has_many   :cart_items
  has_many   :order_items
  # has_one  :image, as: :imageable,class_name: 'Picture', dependent: :destroy
  has_one :picture, as: :imageable, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "name", "price", "restaurant_id", "food_type", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["cart_items", "category", "restaurant"]
  end
end

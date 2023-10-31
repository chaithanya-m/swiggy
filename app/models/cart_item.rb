class CartItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :cart


  def self.ransackable_attributes(auth_object = nil)
    ["cart_id", "created_at", "food_item_id", "id", "quantity", "updated_at"]
  end

end

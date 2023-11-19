class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many   :order_items

  def self.ransackable_attributes(auth_object = nil)
    ["address_id", "created_at", "id", "total_items", "total_price", "updated_at", "user_id"]
  end
end

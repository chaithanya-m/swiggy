class Category < ApplicationRecord

  has_many :food_items


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["food_items"]
  end


end

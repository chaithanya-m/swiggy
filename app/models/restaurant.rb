class Restaurant < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["area", "created_at", "id", "name", "spaciality", "updated_at"]
  end

end

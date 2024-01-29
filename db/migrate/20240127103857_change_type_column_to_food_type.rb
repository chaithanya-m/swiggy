class ChangeTypeColumnToFoodType < ActiveRecord::Migration[7.0]
  def change
    rename_column :food_items, :type, :food_type
  end
end

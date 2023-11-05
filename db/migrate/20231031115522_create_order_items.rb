class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :food_item, null: false, foreign_key: true
      t.decimal :item_price , default:0.0
      t.integer :quantity, default:0
      t.decimal :item_total_price, default:0.0

      t.timestamps
    end
  end
end

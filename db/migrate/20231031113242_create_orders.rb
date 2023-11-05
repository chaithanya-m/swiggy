class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.decimal :total_price, default: 0.0
      t.integer :total_items, default: 0

      t.timestamps
    end
  end
end

class MigrationtochangeDefultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :cart_items, :quantity, 0

  end
end

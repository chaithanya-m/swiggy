class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :pic
      t.references :Imageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

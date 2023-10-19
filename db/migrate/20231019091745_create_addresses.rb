class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false
      t.string :door_number
      t.string :street_area
      t.string :city
      t.string :state
      t.string :zipcode


      t.timestamps
    end
  end
end

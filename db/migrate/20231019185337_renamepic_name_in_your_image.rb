class RenamepicNameInYourImage < ActiveRecord::Migration[7.0]
  def change
    rename_column :images, :pic, :image

  end
end

class AddPhotosToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :photo_one, :string
    add_column :stores, :photo_two, :string
    add_column :stores, :photo_three, :string
  end
end

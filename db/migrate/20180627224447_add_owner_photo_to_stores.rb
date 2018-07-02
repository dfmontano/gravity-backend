class AddOwnerPhotoToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :owner_photo, :string
  end
end

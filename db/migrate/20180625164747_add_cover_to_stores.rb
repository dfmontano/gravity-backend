class AddCoverToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :cover, :string
  end
end

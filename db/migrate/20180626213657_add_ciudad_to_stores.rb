class AddCiudadToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :ciudad, :string
    add_column :stores, :provincia, :string
  end
end

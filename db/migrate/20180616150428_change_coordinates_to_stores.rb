class ChangeCoordinatesToStores < ActiveRecord::Migration[5.2]
  def change
    change_column :stores, :latitud, :decimal, :precision => 9, :scale => 6
    change_column :stores, :longitud, :decimal, :precision => 9, :scale => 6
  end
end

class ChangeCoordinatesPrecisionToStores < ActiveRecord::Migration[5.2]
  def change
    change_column :stores, :latitud, :decimal, :precision => 11, :scale => 8
    change_column :stores, :longitud, :decimal, :precision => 11, :scale => 8
  end
end

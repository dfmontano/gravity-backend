class ChangeCelularToStores < ActiveRecord::Migration[5.2]
  def change
    change_column :stores, :celular, :string
    change_column :stores, :fijo, :string
  end
end

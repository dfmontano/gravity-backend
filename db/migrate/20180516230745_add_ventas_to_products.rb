class AddVentasToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :ventas, :integer
  end
end

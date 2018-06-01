class AddApprovedToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :approved, :boolean, default: false
  end
end

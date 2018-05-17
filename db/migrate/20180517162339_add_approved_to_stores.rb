class AddApprovedToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :approved, :boolean
  end
end

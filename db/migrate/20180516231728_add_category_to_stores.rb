class AddCategoryToStores < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :category, foreign_key: true
    add_reference :stores, :subcategory, foreign_key: true
  end
end

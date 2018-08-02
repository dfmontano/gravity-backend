class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.string :status
      t.string :courier_name
      t.decimal :total_price, precision: 10, scale: 2
      t.decimal :shipping_cost, precision: 10, scale: 2
      t.decimal :latitude, precision: 11, scale: 8
      t.decimal :longitude, precision: 11, scale: 8
      t.string :address_reference
      t.string :commentary
      t.string :pay_method

      t.timestamps
    end
  end
end

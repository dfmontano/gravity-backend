class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|

      t.string :nombre, null: false
      t.text :descripcion
      t.string :slogan
      t.integer :fijo
      t.integer :celular
      t.string :propietario
      t.integer :ruc

      # Address Attributes
      t.string :calle_principal
      t.string :calle_secundaria
      t.string :sector
      t.decimal :latitud
      t.decimal :longitud
      t.string :referencia

      # Social link attributes
      t.string :webpage_link
      t.string :facebook_link
      t.string :twitter_link
      t.string :instagram_link

      t.timestamps
    end
  end
end

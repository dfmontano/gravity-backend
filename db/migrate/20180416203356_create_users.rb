class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :email, null: false, index: true, unique: true
      t.string :cedula, null: false, unique: true
      t.string :nombres, null: false
      t.string :apellidos, null: false
      t.string :password_digest, null: false
      t.date :fecha_nacimiento
      t.string :genero

      t.string :barrio_sector
      t.string :calle_principal
      t.string :calle_secundaria
      t.string :referencia
      t.decimal :latitud
      t.decimal :longitud

      t.string :convencional
      t.string :celular, null: false, default: 0000000000

      t.string :empresa

      t.timestamps
    end
  end
end

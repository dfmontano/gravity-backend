class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :email, null: false, index: true, unique: true
      t.string :cedula, null: false, unique: true
      t.string :nombres, null: false
      t.string :apellidos, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end

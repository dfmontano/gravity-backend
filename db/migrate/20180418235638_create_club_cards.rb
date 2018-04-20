class CreateClubCards < ActiveRecord::Migration[5.2]
  def change
    create_table :club_cards do |t|
      t.string :number

      t.timestamps
    end
  end
end

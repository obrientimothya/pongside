class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :code
      t.string :last_name
      t.string :first_name
      t.string :country

      t.timestamps
    end
  end
end

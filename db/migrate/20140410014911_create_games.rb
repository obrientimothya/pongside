class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :match_id
      t.integer :game_number
      t.integer :a_score
      t.integer :b_score

      t.timestamps
    end
    add_index :games, :match_id
    add_index :games, :game_number
    add_index :games, [:match_id, :game_number], unique: true
  end
end

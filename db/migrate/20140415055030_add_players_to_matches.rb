class AddPlayersToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :player_a_id, :integer
    add_column :matches, :player_b_id, :integer
    add_index :matches, :player_a_id
    add_index :matches, :player_b_id
  end
end

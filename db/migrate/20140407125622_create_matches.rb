class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :a_first_name
      t.string :a_last_name
      t.string :a_country
      t.string :b_first_name
      t.string :b_last_name
      t.string :b_country
      t.boolean :is_running, default: false
      t.boolean :is_over, default: false
      t.integer :table_id
      t.timestamp :started_at
      t.timestamp :finished_at
      t.boolean :a_red_card, default: false
      t.boolean :a_yellow_card, default: false
      t.boolean :a_timeout, default: false
      t.boolean :b_red_card, default: false
      t.boolean :b_yellow_card, default: false
      t.boolean :b_timeout, default: false

      t.timestamps
    end
    add_index :matches, :table_id
    add_index :matches, :is_running
    add_index :matches, :is_over
  end
end

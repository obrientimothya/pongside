class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.boolean :reverse_ends, default: false

      t.timestamps
    end
  end
end

class AddBannerIdToTables < ActiveRecord::Migration
  def change
    add_column :tables, :banner_id, :integer
    add_index :tables, :banner_id
  end
end

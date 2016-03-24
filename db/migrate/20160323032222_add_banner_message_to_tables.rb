class AddBannerMessageToTables < ActiveRecord::Migration
  def change
    add_column :tables, :banner_message, :string
  end
end

class AddServerToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :server, :string
  end
end

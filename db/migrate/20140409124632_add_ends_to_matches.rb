class AddEndsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :left_side, :string
    add_column :matches, :right_side, :string
  end
end

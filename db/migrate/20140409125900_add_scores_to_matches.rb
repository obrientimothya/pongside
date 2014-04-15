class AddScoresToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :a_score, :integer, default: 0
    add_column :matches, :b_score, :integer, default: 0
  end
end

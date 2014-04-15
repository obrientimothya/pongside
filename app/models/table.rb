class Table < ActiveRecord::Base
  has_many :matches

  validates_presence_of :name
  validates_uniqueness_of :name
  
end

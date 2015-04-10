class Table < ActiveRecord::Base
  has_many :matches
  belongs_to :banner

  validates_presence_of :name
  validates_uniqueness_of :name
  
end

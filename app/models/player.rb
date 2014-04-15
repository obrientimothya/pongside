class Player < ActiveRecord::Base
  validates_presence_of :code, :last_name, :country

  default_scope { order("players.code ASC") }

  def list_name
    "#{self.code} #{self.last_name} #{self.first_name}"
  end

end

class Game < ActiveRecord::Base
  belongs_to :match

  default_scope { order("games.game_number ASC") }

end

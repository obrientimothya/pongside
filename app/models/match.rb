class Match < ActiveRecord::Base
  belongs_to :table
  has_many :games
  belongs_to :player_a, class_name: "Player", foreign_key: :player_a_id
  belongs_to :player_b, class_name: "Player", foreign_key: :player_b_id

  validates_presence_of :table_id, :player_a_id, :player_b_id

  default_scope { order("matches.is_running DESC, matches.is_over ASC") }

  def left_player
    if self.left_side.blank?
      return "a"
    else
      return self.left_side
    end
  end

  def right_player
    if self.right_side.blank?
      return "b"
    else
      return self.right_side
    end
  end

  def a_name
    name = ""
    name += "#{self.player_a.first_name[0..0].upcase}. " unless self.player_a.first_name.blank?
    name += "#{self.player_a.last_name.upcase}"
    return name
  end

  def b_name
    name = ""
    name += "#{self.player_b.first_name[0..0].upcase}. " unless self.player_b.first_name.blank?
    name += "#{self.player_b.last_name.upcase}"
    return name
  end

  # number of games won by player
  def a_wins
    unless self.games.blank?
      return self.games.where("games.a_score > games.b_score").size
    else
      return 0
    end
  end

  def b_wins
    unless self.games.blank?
      return self.games.where("games.b_score > games.a_score").size
    else
      return 0
    end
  end

end

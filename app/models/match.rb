class Match < ActiveRecord::Base
  belongs_to :table
  has_many :games

  validates_presence_of :table_id, :a_last_name, :b_last_name

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
    name += "#{self.a_first_name[0..0].upcase}. " unless self.a_first_name.blank?
    name += "#{self.a_last_name.upcase}"
    return name
  end

  def b_name
    name = ""
    name += "#{self.b_first_name[0..0].upcase}. " unless self.b_first_name.blank?
    name += "#{self.b_last_name.upcase}"
    return name
  end

  # number of games won by player
  def a_wins
    if self.games.size > 0
      return self.games.where("games.a_score > games.b_score").size
    else
      return 0
    end
  end

  def b_wins
    if self.games.size > 0
      return self.games.where("games.b_score > games.a_score").size
    else
      return 0
    end
  end

end

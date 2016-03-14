class Game < ActiveRecord::Base
  belongs_to :winner_1, :class_name => 'Player'
  belongs_to :winner_2, :class_name => 'Player'
  belongs_to :loser_1, :class_name => 'Player'
  belongs_to :loser_2, :class_name => 'Player'
  belongs_to :first_server_1, :class_name => 'Player'
  belongs_to :first_server_2, :class_name => 'Player'
  
#  scope :singles, ->(player) { where(winner_1: player).where(winner_2: nil) }
#  scope :doubles, ->(player) { where(winner_1: player).where.not(winner_2: nil) }
#  scope :doubles, ->(player) {where("(winner_1_id = ? AND winner_2_id IS NOT NULL)" \
#                                    " OR winner_2_id = ?", player.id, player.id) }
  scope :singles, -> { where(winner_2: nil) }
  scope :doubles, -> { where.not(winner_2: nil) }
  
  def self.by_player(player)
    where("winner_1_id = ? OR winner_2_id = ? OR loser_1_id = ? OR loser_2_id = ?",
      player.id, player.id, player.id, player.id)
  end
  
  def self.won(player)
    where("winner_1_id = ? OR winner_2_id = ?", player.id, player.id)
  end
  
  def self.lost(player)
    where("loser_1_id = ? OR loser_2_id = ?", player.id, player.id)
  end
end

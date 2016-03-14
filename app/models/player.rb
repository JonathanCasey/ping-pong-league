class Player < ActiveRecord::Base
  
  def games
    Game.by_player(self)
  end
  
  def games_won
    Game.won(self)
  end
  
  def games_lost
    Game.lost(self)
  end
end

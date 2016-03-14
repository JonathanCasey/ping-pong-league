require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  test "game relations" do
    # Create example players
    player1 = Player.create(name: "guy1")
    player2 = Player.create(name: "guy2")
    player3 = Player.create(name: "guy3")
    player4 = Player.create(name: "guy4")
    player5 = Player.create(name: "guy5")
    
    # Create example games
    game1 = Game.create(winner_1: player2, winner_2: nil,
                        loser_1: player1, loser_2: nil)
    game2 = Game.create(winner_1: player3, winner_2: nil,
                        loser_1: player4, loser_2: nil)
    game3 = Game.create(winner_1: player5, winner_2: nil,
                        loser_1: player2, loser_2: nil)
    game4 = Game.create(winner_1: player4, winner_2: player3,
                        loser_1: player1, loser_2: player2)
    game5 = Game.create(winner_1: player2, winner_2: player3,
                        loser_1: player1, loser_2: player5)
    
    # Ensure counts match as expected
    assert(player2.games.count == 4,
        "Actual games: #{player2.games.count}")
    assert(player2.games_won.count == 2,
        "Actual games won: #{player2.games_won.count}")
    assert(player2.games_lost.count == 2,
        "Actual games lost: #{player2.games_lost.count}")
    assert(player2.games.singles.count == 2,
        "Actual singles games: #{player2.games.singles.count}")
    assert(player2.games.doubles.count == 2,
        "Actual doubles games: #{player2.games.doubles.count}")
    assert(player2.games_won.singles.count == 1,
        "Actual singles games won: #{player2.games_won.singles.count}")
    assert(player2.games_lost.doubles.count == 1,
        "Actual doubles games lost: #{player2.games_lost.doubles.count}")
    
    #puts player2.games
  end
end

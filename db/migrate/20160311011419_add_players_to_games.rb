class AddPlayersToGames < ActiveRecord::Migration
  def change
    add_reference :games, :winner_1, index: true
    add_foreign_key :games, :players, column: :winner_1_id
    
    add_reference :games, :winner_2, index: true
    add_foreign_key :games, :players, column: :winner_2_id
    
    add_reference :games, :loser_1, index: true
    add_foreign_key :games, :players, column: :loser_1_id
    
    add_reference :games, :loser_2, index: true
    add_foreign_key :games, :players, column: :loser_2_id
    
    add_reference :games, :first_server_1, index: true
    add_foreign_key :games, :players, column: :first_server_1_id
    
    add_reference :games, :first_server_2, index: true
    add_foreign_key :games, :players, column: :first_server_2_id
  end
end

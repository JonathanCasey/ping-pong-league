class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      
      t.integer :winner_score
      t.integer :loser_score
      
      t.integer :scorecard, :limit => 8
      
      t.timestamps null: false
    end
  end
end

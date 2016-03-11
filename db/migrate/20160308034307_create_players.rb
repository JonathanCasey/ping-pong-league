class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :slack_name
      t.float :elo_rating
      t.boolean :is_active
      
      t.timestamps null: false
    end
  end
end

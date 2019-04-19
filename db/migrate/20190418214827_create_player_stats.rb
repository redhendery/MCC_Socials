class CreatePlayerStats < ActiveRecord::Migration[5.2]
  def change
    create_table :player_stats do |t|
      t.belongs_to :user, index: true

      # Batting Stats
      t.integer :games_played, default: 0
      t.integer :bat_innings, default: 0
      t.integer :not_outs, default: 0
      t.integer :bat_runs, default: 0
      t.integer :high_score, default: 0
      t.integer :balls_faced, default: 0
      t.integer :hundreds, default: 0
      t.integer :fifties, default: 0
      t.integer :fours, default: 0
      t.integer :sixes, default: 0

      # Fielding Stats
      t.integer :catches, default: 0
      t.integer :run_outs, default: 0
      t.integer :stumpings, default: 0

      # Bowling Stats
      t.integer :bowl_innings, default: 0
      t.integer :balls_bowled, default: 0
      t.integer :bowl_runs, default: 0
      t.integer :wickets, default: 0
      t.string :best_bowling, default: '0/0'

    end
  end
end

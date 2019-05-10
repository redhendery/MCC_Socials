class AddAwayScoreToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :away_score, :integer
    add_column :schedules, :away_wickets, :integer
    add_column :schedules, :away_overs, :float
  end
end

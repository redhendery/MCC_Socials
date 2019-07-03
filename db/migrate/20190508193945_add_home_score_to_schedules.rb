class AddHomeScoreToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :home_score, :integer
    add_column :schedules, :home_wickets, :integer
    add_column :schedules, :home_overs, :float
  end
end

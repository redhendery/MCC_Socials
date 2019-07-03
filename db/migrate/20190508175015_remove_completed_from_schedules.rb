class RemoveCompletedFromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :completed, :boolean
  end
end

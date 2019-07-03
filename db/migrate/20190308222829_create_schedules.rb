class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.time :start_time, default: '10:45'
      t.string :opponent
      t.string :team
      t.integer :series_game
      t.string :location
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end

class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.string :opponent
      t.integer :series_game
      t.string :location, default: 'Piper Park, Larkspur'

      t.timestamps
    end
  end
end

class CreateGameStats < ActiveRecord::Migration[5.2]
  def change
    create_table :game_stats do |t|
      t. belongs_to :schedule, index: true

    end
  end
end

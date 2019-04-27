class Schedule < ApplicationRecord
  after_create :create_game_stat
  has_one :game_stat, dependent: :destroy
  has_many :selections
  has_many :users, through: :selections
  validates :opponent, :start_time, :series_game, :location, :team, presence: true
end

class Schedule < ApplicationRecord
  has_one :game_stat, dependent: :destroy
  after_create :create_game_stat
  has_many :selections
  has_many :users, through: :selections
  validates :date, uniqueness: true
  validates :opponent, :series_game, :location, presence: true
end

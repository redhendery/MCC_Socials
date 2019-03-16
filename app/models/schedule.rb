class Schedule < ApplicationRecord
  has_many :availabilities
  has_many :users, through: :availabilities
  validates :date, :opponent, :series_game, :location, presence: true
end

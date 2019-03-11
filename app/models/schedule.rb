class Schedule < ApplicationRecord
  validates :date, :opponent, :series_game, :location, presence: true
end

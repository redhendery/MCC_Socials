class Schedule < ApplicationRecord
  has_many :selections
  has_many :users, through: :selections
  validates :date, :opponent, :series_game, :location, presence: true
end

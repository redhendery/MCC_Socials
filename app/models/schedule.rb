class Schedule < ApplicationRecord
  has_and_belongs_to_many :users
  validates :date, :opponent, :series_game, :location, presence: true
end

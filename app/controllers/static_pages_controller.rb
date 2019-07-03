class StaticPagesController < ApplicationController
  def home
    @upcoming = Schedule.where(date: next_week)
    @previous = Schedule.where(date: last_week).where.not(date: Date.today)
  end

  def about
  end

  def membership
  end
end

class StaticPagesController < ApplicationController
  def home
    @upcoming = Schedule.where(date: next_week)
    @previous = Schedule.where(date: last_week)
  end

  def about
  end

  def membership
  end
end

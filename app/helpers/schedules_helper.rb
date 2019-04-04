module SchedulesHelper

  def next_week
    Date.current..(Date.current + 7)
  end

end

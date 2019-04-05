module SchedulesHelper

  def next_week
    Date.current..(Date.current + 7)
  end

  def last_week
    (Date.current - 7)..Date.current
  end

end

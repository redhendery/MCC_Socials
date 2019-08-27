require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  def setup
    @schedule = schedules(:one)
  end

  test 'Schedule should be valid' do
    assert_not @schedule.valid?
  end

  test 'opponent should be present' do
    @schedule.opponent = '      '
    assert_not @schedule.valid?
  end

  test 'series game should be present' do
    @schedule.series_game = '      '
    assert_not @schedule.valid?
  end

  test 'location should be present' do
    @schedule.location = '      '
    assert_not @schedule.valid?
  end
end

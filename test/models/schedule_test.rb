require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  def setup
    @schedule = schedules(:one)
  end

  test 'should be valid' do
    assert @schedule.valid?
  end

  test 'date should be present' do
    @schedule.date = '      '
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

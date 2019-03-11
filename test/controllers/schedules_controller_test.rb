require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @other_user = users(:mike)
    @schedule = schedules(:one)
  end

  test 'should get schedules' do
    get schedules_path
    assert_response :success
    assert_select 'title', 'All Games | Marin Cricket Club'
  end

  test 'should redirect edit when not logged in' do
    get edit_schedule_path(@schedule)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect edit when logged in as a non-admin' do
    log_in_as(@other_user)
    get edit_schedule_path(@schedule)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect destroy when not logged in' do
    delete schedule_path(@schedule)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect destroy when logged in as a non-admin' do
    log_in_as(@other_user)
    assert_no_difference 'Schedule.count' do
      delete schedule_path(@schedule)
    end
    assert_redirected_to root_url
  end
end

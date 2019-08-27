require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @other_user = users(:mike)
    @schedule = schedules(:one)
  end

  test 'should get Socials schedules' do
    get socials_schedules_path
    assert_response :success
    assert_select 'title', 'Socials XI Games | Marin Cricket Club'
  end

  test 'should get Second XI schedules' do
    get seconds_schedules_path
    assert_response :success
    assert_select 'title', 'Second XI Games | Marin Cricket Club'
  end

  test 'should get First XI schedules' do
    get firsts_schedules_path
    assert_response :success
    assert_select 'title', 'First XI Games | Marin Cricket Club'
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

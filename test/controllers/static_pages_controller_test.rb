require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = 'Marin Cricket Club'
  end

  test 'should get home page' do
    get root_url
    assert_response :success
    assert_select 'title', 'Marin Cricket Club'
  end

  test 'should get about page' do
    get static_pages_about_url
    assert_response :success
    assert_select 'title', 'About | Marin Cricket Club'
  end

  test 'should get contact page' do
    get static_pages_contact_url
    assert_response :success
    assert_select 'title', 'Contact | Marin Cricket Club'
  end

end

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test 'should get home page' do
    get root_path
    assert_response :success
    assert_select 'title', 'Marin Cricket Club'
  end

  test 'should get about page' do
    get about_path
    assert_response :success
    assert_select 'title', 'About | Marin Cricket Club'
  end

  test 'should get contact page' do
    get contact_index_path
    assert_response :success
    assert_select 'title', 'Contact | Marin Cricket Club'
  end

end

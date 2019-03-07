require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test 'layout links' do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_index_path
    assert_select "a[href=?]", sponsors_path
    get about_path
    assert_select 'title', full_title('About')
    get contact_index_path
    assert_select 'title', full_title('Contact')
    get sponsors_path
    assert_select 'title', full_title('Sponsors')
  end

end

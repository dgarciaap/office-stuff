require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get root' do
    get root_url
    assert_response :success
    assert_select 'title','OfficeStuff'
  end

  test 'should get post' do
    get '/post'
    assert_response :success
  end

  test 'should get show' do
    get '/post'
    assert_response :success
  end
end

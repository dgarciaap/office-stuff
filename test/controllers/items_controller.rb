require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get items' do
    get items_path
    assert_response :success
    assert_select 'title','OfficeStuff'
  end

  test 'should get new item' do
    get new_item_url
    assert_response :success
  end

  test 'should get show' do
    get '/show'
    assert_response :success
  end
end

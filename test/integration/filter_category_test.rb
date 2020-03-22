require 'test_helper'

class FilterCategoryTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(email: 'dgarcia@gmail.com', password: 'abcd1234')
  end

  test 'items get filtered by open status' do
    get items_path
    assert_select('select#filter option[selected]').first['value']
    
    get '/items/index?filter=0'
    assert_response :success
  end

  test 'items get filtered by fulfill status' do
    get items_path
    assert_select('select#filter option[selected]').first.next['value']
    
    get '/items/index?filter=1'
    assert_response :success
  end

  test 'items get filtered by dismiss status' do
    get items_path
    assert_select('select#filter option[selected]').last['value']
    
    get '/items/index?filter=2'
    assert_response :success
  end
end

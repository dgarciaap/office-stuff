require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @item = Item.new(name: 'Froggy Chair', category: 'Stationary')
  end

  test 'should get items' do
    get items_path
    assert_response :success
    assert_select 'title','OfficeStuff'
  end

  test 'should get new item' do
    get new_item_url
    assert_response :success
  end

  test 'items get filtered by open status' do
    get items_path
    assert_select('select#filter option[selected]').first['value']
    get '/items?filter=0&commit=Filter'
    assert_response :success
  end

  test 'items get filtered by fulfill status' do
    get items_path
    assert_select('select#filter option[selected]').first.next['value']
    get '/items?filter=1&commit=Filter'
    assert_response :success
  end

  test 'items get filtered by dismiss status' do
    get items_path
    assert_select('select#filter option[selected]').last['value']
    get '/items?filter=2&commit=Filter'
    assert_response :success
  end

  test 'admin user changes an item to fulfill' do
    get items_path
    post "/items/fulfill?id=#{@item.id}"
  end

  test 'common user changes an item to dismiss' do
    get items_path
    post "/items/dismiss?id=#{@item.id}"
  end
end

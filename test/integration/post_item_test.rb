require 'test_helper'

class PostItemTest < ActionDispatch::IntegrationTest
  test 'invalid item post' do
    get '/items/new'
    assert_no_difference 'Item.count' do
      post items_path, params: { item: { name: '',
				      category: '' } }
    end
    assert_template 'items/new'
  end

  test 'valid item post' do
    get '/items/new'
    assert_difference 'Item.count', 1 do
      post items_path, params: { item: { name: 'Computer cleaner',
				      category: 'PC stuff' } }
    end
    follow_redirect!
    assert_template 'items/index'
  end
end

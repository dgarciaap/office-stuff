require 'test_helper'

class PostItemTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(email: 'dg38828@gmail.com', password: '1223', role: 1)
    @item = Item.create(name: 'froggy chair', category: 'Stationary')
    post users_path, params: { user: { email: @user.email,
					     password: @user.password } }
  end

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
      post items_path, params: { item: { name: @item.name,
					 category: @item.category } }
    end
    follow_redirect!
    assert_template 'items/index'
  end
end

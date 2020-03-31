require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: 'dg38828@gmail.com', password: '1223', role: 1)
    owner = User.create(email: 'dg@gmail.com', password: 'abcd')
    @item = Item.create(name: 'froggy chair', category: 'Stationary', user_id: owner.id)
    post users_path, params: { user: { email: @user.email,
					     password: @user.password } }
  end

  test 'create comment' do
    get "/items/#{@item.id}"
    assert_difference 'Comment.count', 1 do
      post "/items/#{@item.id}/comments", params: { comment: { commenter: 'Tester', 
							       body: 'Testing' }, item_id: @item.id }
    end
    follow_redirect!
    assert_template 'items/show'
  end 
end

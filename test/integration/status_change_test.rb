require 'test_helper'

class StatusChangeTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(email: 'dgarcia@gmail.com', password: 'abcd1234', role: 1)
    @item = Item.new(name: 'Froggy Chair', category: 'Stationary')
  end

  test 'admin user changes an item to fulfill' do
    get items_path
    get "items/fulfill?id=#{@item.id}"
  end
end

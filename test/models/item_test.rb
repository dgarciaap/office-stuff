require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.create(name: 'Computer cleaner', category: 'PC stuff')
  end

  test 'valid item with arguments' do
    assert @item.valid?
  end

  test 'invalid item without arguments' do
    item = Item.create
    assert_not item.valid?
  end

  test 'invalid item with empty strings' do
    @item.name = ''
    @item.category = ''
    assert_not @item.valid?
  end
end

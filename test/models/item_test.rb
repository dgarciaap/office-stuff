require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(name: 'Computer cleaner', category: 'PC stuff')
  end

  test 'valid item with arguments' do
    assert @item.valid?
  end

  test 'invalid item without arguments' do
    item = Item.new
    assert_not item.valid?
  end

  test 'invalid item with empty strings' do
    @item.name = ''
    @item.category = ''
    assert_not @item.valid?
  end
end
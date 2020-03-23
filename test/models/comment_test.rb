require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    item = Item.create(name: 'Froggy chair', category: 'Stationary')
    @comment = Comment.create(commenter: 'Diana', body: 'I agree', item_id: item.id)
  end

  test 'valid comment' do
    assert @comment.valid? 
  end

  test 'invalid comment' do
    comment = Comment.new
    assert_not comment.valid?
  end

  test 'invalid comment with empty strings' do
    @comment.commenter = ''
    @comment.body = ''
    assert_not @comment.valid?
  end
end

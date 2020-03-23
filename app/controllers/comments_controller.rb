class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.create(comment_params)
    UserMailer.new_comment(current_user, @item).deliver_later
    redirect_to item_path(@item)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

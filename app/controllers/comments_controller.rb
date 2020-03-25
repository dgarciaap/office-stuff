class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.create(comment_params)
    NewCommentJob.perform_now(current_user.email, @item)
    redirect_to item_path(@item)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_param)
    if comment.save
      flash[:success] = 'Comment was successfully create'
    else
      flash[:alert] = 'Error'
    end
    redirect_to :back
  end

  def update

  end

  def delete

  end

  private
  def comment_param
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end
end

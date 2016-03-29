class InnerCommentsController < ApplicationController
  def create
    inner_comment = InnerComment.new(inner_comment_params)
    if inner_comment.save
      flash[:success] = 'Comment was successfully create'
    else
      flash[:alert] = 'Error'
    end
    redirect_to :back
  end

  def update

  end

  def destroy

  end

  private
  def inner_comment_params
    params.require(:inner_comment).permit(:content, :comment_id, :user_id)
  end
end

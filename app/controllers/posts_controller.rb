class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :update]

  def index

  end

  def show

  end

  def create
    post = Post.new(post_params)
    if post.save
      flash[:success] = 'Post was successfully create'
    else
      flash[:alert] = 'Error'
    end
    redirect_to :back
  end

  def destroy
    post = Post.find(params[:id])
    if post.delete
      flash[:success] = 'Post was successfully delete'
    else
      flash[:alert] = 'Error'
    end
    redirect_to :back
  end

  def update

  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  private
  def post_params
    params.require(:post).permit(:author, :title, :content, :user_id)
  end
end

class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :update, :destroy]

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
      @error = false
    else
      @error = true
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    flash[:success] = 'Update was successfully'
    redirect_to user_posts_path(current_user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  private
  def post_params
    params.require(:post).permit(:author, :title, :content, :user_id)
  end
end

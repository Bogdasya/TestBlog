class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'users/new'
    end
  end

  def show
  end

  def update
    if params[:user][:image].present?
      file = params[:user][:image]
      current_user.image = file.original_filename
      File.open(Rails.root.join('app','assets', 'images', file.original_filename), 'wb') do |f|
        f.write(file.read)
      end
    end
    current_user.update_attributes(users_params.except(:image))
    flash[:success] = 'Update was successfully'
    redirect_to :back
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :surname)
  end

end

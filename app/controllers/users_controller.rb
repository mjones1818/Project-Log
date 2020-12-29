class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @projects = Project.where(user: @user)
  end

  def new
    @user = User.new
    render 'new'
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

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
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @projects = Project.where(user: @user)
  end
end

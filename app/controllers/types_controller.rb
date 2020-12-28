class TypesController < ApplicationController
  before_action :require_login
  def new

  end

  def show
    @projects = Project.where(type_id: params[:id])
  end

  def create

  end

  def destroy

  end

  def edit

  end

  def update
    
  end

  private

  def require_login
    flash[:notice] = SIGN_IN_ERROR
    redirect_to signin_path unless session.include? :user_id
  end
end

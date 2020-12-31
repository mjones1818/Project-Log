class TypesController < ApplicationController
  before_action :require_login
  def new

  end

  def show
    if Type.find_by(name: params[:id].titleize) == nil
      @projects = Project.where(type_id: params[:id])
    else
      type = Type.find_by(name: params[:id].titleize)
      @projects = Project.where(type_id: type.id)
    end
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

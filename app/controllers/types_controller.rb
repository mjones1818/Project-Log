class TypesController < ApplicationController
  before_action :require_login
  def new

  end

  def index

  end

  def show

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

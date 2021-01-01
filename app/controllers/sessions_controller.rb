class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(4)
      end
      session[:user_id] = user.id
      redirect_to user_path(user)
    end  
  end

  def login
    user = User.find_by(name: user_params[:name])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Incorrect Login Credentials"
      redirect_to '/signin'
    end
  end

  def logout
    session.delete :user_id
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def auth
    request.env['omniauth.auth']
  end
end

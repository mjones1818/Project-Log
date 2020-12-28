module ApplicationHelper

  def logged_in?
    session.include? :user_id
  end

  def current_user
    session[:user_id]
  end
end

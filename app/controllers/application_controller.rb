class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for user
    session[:forward_url] ? session.delete(:forward_url) : super
  end

  def require_all_access
    unless admin_signed_in? && current_admin.all_access?
      if admin_signed_in?
        redirect_to root_path, :notice => "You do not have access to this area."
      else
        session[:forward_url] = request.fullpath
        redirect_to new_admin_session_path, :notice => "Admin only. Please sign in."
      end
    end
  end

  def require_admin_user
    unless admin_signed_in?
      session[:forward_url] = request.fullpath
      redirect_to new_admin_session_path, :notice => "Admin only.  Please sign in."
    end
  end
  
end

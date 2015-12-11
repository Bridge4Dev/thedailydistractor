class PostsController < ApplicationController

  before_action :require_admin_user, only: [:new, :create]
  before_action :require_all_access, only: [:edit, :update]

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit

  end

  def update
  end

  def destroy
  end


  private


    def require_admin_user
      unless admin_signed_in?
        session[:forward_url] = request.fullpath
        redirect_to new_admin_session_path, :notice => "Admin only.  Please sign in."
      end
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

end

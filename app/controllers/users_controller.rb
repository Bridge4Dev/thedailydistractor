class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]
  before_action :require_login, only: [:show]

  def show

  end


  def edit
    
  end


  def update
    if @user.update(user_params)
      sign_in @user
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def finish_signup
    if request.patch? && params[:user]
      if @user.update(user_params)
        sign_in @user
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end


  def destroy
    @user.destroy
    redirect_to root_url
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def require_login
      unless user_signed_in?
        session[:forward_url] = request.fullpath
        redirect_to new_user_session_path, notice: "Please sign in."
      end
    end

    def user_params
      accessible = [ :name, :email ] # add additional params here
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
      

end

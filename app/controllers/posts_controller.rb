class PostsController < ApplicationController

  before_action :require_admin_user, only: [:new, :create]
  before_action :require_all_access, only: [:edit, :update]

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, :notice => "Post successfully created."
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post, :notice => "Post successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
  end


  private

    def post_params
      params.require(:post).permit(:post_title, :post_content)
    end

end

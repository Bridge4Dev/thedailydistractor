class CategoriesController < ApplicationController

  before_action :require_all_access, only: [:new, :create]


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)
    if @category.save
      redirect_to root_path, :notice => "Category successfully created."
    else
      render 'new'
    end
  end

  private

    def cat_params
      params.require(:category).permit(:post_category)
    end

end

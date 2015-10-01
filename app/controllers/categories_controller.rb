class CategoriesController < ApplicationController
  
  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @title = @category.title
    @post = @category.posts
  end
  
  def new
    redirect_to(:controller => "posts", :action => "new")
  end
end

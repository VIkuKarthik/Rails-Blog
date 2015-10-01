class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :category]
  
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
    @cat = Category.all
  end
  
  def create
    params.permit!
    @post = current_user.posts.build(post_params)
    
    if (@post).save
      flash[:notice] = "Post created successfully."
       redirect_to @post
    else
       render('new')
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated successfully."
        redirect_to @post
    else
        render('edit')
    end
  end

  def delete
     @post = Post.find(params[:id])
  end
  
  def destroy
     post = Post.find(params[:id]).destroy
     flash[:notice] = "Post '#{post.title}' destroyed successfully."
     redirect_to(:action => "index")
  end
  
  private
        
    def post_params
        params.require(:post).permit(:title, :body, :category_id, :image, :avatar)
    end
end

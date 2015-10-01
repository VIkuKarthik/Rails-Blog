class CommentsController < ApplicationController
    
    def create
        params.permit!
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(params[:comment])
        @comment.user_id = current_user.id if current_user || nil
        @comment.save
        redirect_to post_path(@post)
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id]).destroy
        redirect_to post_path(@post)
    end
end

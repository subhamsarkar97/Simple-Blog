class CommentsController < ApplicationController
    def index
    end    
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comments_params)
        #finding the post based on the @post variable and go to the comment model and create
        redirect_to post_path(@post)
    end
     
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
    
    private 
    def comments_params
        params.require(:comment).permit(:name, :comment)
    end    
end

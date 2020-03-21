class PostsController < ApplicationController

    def index
        @post = Post.all.order("Created_at DESC")
    end
     
    def new 
        @post = Post.new #creation of the form
    end
    
    #method making the action
    def create
        @post = Post.new(post_params)
        
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    #method rendering everything
    def show
        @post =Post.find(params[:id])   #here we have to find the post which is created and we
                                        #have to find it by id.             
    end    
    
     #method doing the action
     def update
        @post = Post.find(params[:id])  #to find the actual post

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end        
    
    end    
    
    #method redering the view
    def edit
        @post = Post.find(params[:id]) 
        
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    
    end    
    
   
     
    #to pass the parameters. Here we have to get the permission from rails.
    private
    def post_params
        params.require(:post).permit(:title, :content)
    
    end    

end

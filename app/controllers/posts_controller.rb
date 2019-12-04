class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    respond_to do |format|
      format.html { render :index, locals: { posts: posts } }
    end
  end


  def show
    @post = Post.find(params[:id])
  end

  def new
  end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
       
        @post.save
        redirect_to @post
    end
    
   

  def index
     @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end

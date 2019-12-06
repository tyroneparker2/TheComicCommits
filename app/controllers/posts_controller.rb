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
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

    def create
      @post = Post.new(post_params)
      post = @post
      @post.user_id = current_user.id
      @post.poster = current_user.username
      respond_to do |format|
        format.html {
          if @post.save
            flash[:success] = "Post saved successfully"
            redirect_to @post
          else
            flash.now[:error] = "Post could not be saved" 
            render :new, locals: { post: post } 
          end
        }
      end 
    end
       
  def index
     @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end

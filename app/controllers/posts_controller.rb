class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end

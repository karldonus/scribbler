class PostsController < ApplicationController
  def index
    @posts = Post.all.order(:id).reverse
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/posts/#{@post.id}"
    else
      redirect_to "/posts/new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(post_params)
    @post.update(params[:post])
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/"
  end

  private
  def post_params
    params.require(:post).permit(:author, :post_content, :created_at, :updated_at, :post_id)
  end

end

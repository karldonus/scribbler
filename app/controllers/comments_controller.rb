class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order(:id).reverse
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/comments/#{@comment.id}"
    else
      redirect_to "/posts/new"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(comment_params)
    @comment.update(params[:comment])
    redirect_to "/comments/#{@comment.id}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/"
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :comment_content, :created_at, :updated_at, :post_id, :comment_id)
  end

end

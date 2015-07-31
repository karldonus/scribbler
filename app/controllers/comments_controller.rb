class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order(:id).reverse
  end

  def create
    @user = User.find(session[:user]["id"])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge!({
      user_id: @user.id
    }))

    redirect_to post_path(@post)
  end






  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :created_at, :updated_at, :post_id, :comment_id)
  end

end

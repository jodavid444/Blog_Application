class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post: @post)

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def create
    @comment = Comment.new(post_id: params[:id], author: current_user, text: params[:text])
    if @comment.save
      redirect_to user_post_path(current_user.id, params[:id])
    else
      render :new, alert: 'Error: Comment not saved.'
    end
  end

  def destroy
    Comment.delete(params[:id])
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end
end

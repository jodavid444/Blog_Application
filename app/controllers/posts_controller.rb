# Posts controller class extends application controller
class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
<<<<<<< HEAD
    @posts = @user.posts.includes(:comments)
  end

  def create
    @post = Post.new(author: current_user, title: params[:title], text: params[:text])
    @post.author = current_user

    if @post.save
      redirect_to user_posts_path(id: @post.author_id)
    else
      render :new, alert: 'Error: Post not saved.'
=======
    @posts = Post.where(author_id: @user.id).includes(:comments)
    respond_to do |format|
      format.html
      format.json { render json: @posts }
>>>>>>> development
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
<<<<<<< HEAD
=======

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text).merge(author_id: current_user.id, comments_counter: 0,
                                                                       likes_counter: 0))

    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_post_path(current_user, @post)
        else
          redirect_to new_user_post_path(current_user)
        end
      end
    end
  end

  def destroy
    @post.comments.destroy_all
    @post.destroy
    redirect_to user_path(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
>>>>>>> development
end

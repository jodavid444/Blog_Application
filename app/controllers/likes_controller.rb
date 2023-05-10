class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @like = Like.new(author_id: current_user.id, post_id: post.id)

    respond_to do |format|
      if @like.save
        format.html { redirect_to user_post_path(current_user, post), notice: 'Post was successfully liked.' }
      else
        format.html do
          redirect_to new_user_post_like_path(current_user, post_id: post.id), alert: 'Error liking post.'
        end
      end
    end
  end
end

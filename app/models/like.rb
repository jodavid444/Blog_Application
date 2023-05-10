class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  def count_updater(post_id)
    post = Post.find_by(id: post_id)
    post.likes_counter = Like.where(post_id:).count
    post.save
  end
end

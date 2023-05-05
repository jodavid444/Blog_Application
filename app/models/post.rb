class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def count_updater(author_id)
    user = User.find_by(id: author_id)
    user.posts_counter = Post.where(author_id:).count
    user.save
  end

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end

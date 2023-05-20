# This class represents a blog post.
# A post can have many comments and belongs to a user.
# It also has a title and body, which are required fields.

class Post < ApplicationRecord
<<<<<<< HEAD
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter
=======
  belongs_to :user, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :count_updater
  after_destroy :count_updater
>>>>>>> development

  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end

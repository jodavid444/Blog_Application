require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Fuad', posts_counter: 0) }
  subject do
    Post.new(author_id: user.id, title: 'Hello', text: 'This is my post', comments_counter: 1, likes_counter: 1)
  end

  before { subject.save }

  context 'Testing validation' do
    it 'Title should be invalid with nil value' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Title must not exceed 250 characters' do
      expect(subject.title.length).to be <= 250
    end

    it 'CommentsCounter must be an integer greater than or equal to zero.' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'LikesCounter must be an integer greater than or equal to zero.' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should update count of posts' do
      expect(subject.count_updater).to be true
    end
  end

  context 'Testing behavior' do
    before { 10.times { Comment.create(author_id: user.id, post_id: subject.id, text: 'Text') } }
    it 'lists the most 5 recent posts' do
      expect(subject.recent_comments.length).to eq 5
    end
  end
end

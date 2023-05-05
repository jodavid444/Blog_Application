require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Fuad', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student', posts_counter: 0) }
  before { subject.save }

  context 'Testing validations' do
    it 'User is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'User is a valid with a name' do
      expect(subject).to be_valid
    end

    it 'User is not a valid with a negative posts_counter' do
      subject.posts_counter = -10
      expect(subject).to_not be_valid
    end

    it 'User is valid with a positive posts_counter' do
      expect(subject).to be_valid
    end
  end

  context 'Testing behavior' do
    let(:user) { subject }

    before do
      5.times do
        Post.create!(author_id: user.id, title: 'Hello World', text: 'Text', comments_counter: 1, likes_counter: 1)
      end
    end

    it 'lists the most 3 recent posts' do
      expect(user.recent_posts.count).to eq 3
    end
  end
end

require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'Make a get request to index' do
    before(:example) do
      @user = User.create(name: 'Fuad', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student',
                          posts_counter: 0)
      @post = Post.create(author_id: @user.id, title: 'Hello 1', text: 'This is my post', comments_counter: 0,
                          likes_counter: 0)
      get user_posts_path(@user)
    end
    it 'Response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the :index template' do
      expect(response).to render_template(:index)
    end

    it 'Response body includes correct text' do
      expect(response.body).to include('This is all posts')
    end
  end

  it 'I can see a section for pagination if there are more posts than fit on the view' do
    expect(response.body).to include('Next Page')
  end

  context 'Make a get request to user' do
    before(:example) do
      @user = User.create(name: 'Fuad', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student',
                          posts_counter: 0)
      @post = Post.create(author_id: @user.id, title: 'Hello 1', text: 'This is my post', comments_counter: 0,
                          likes_counter: 0)
      get user_post_path(@user, @post)
    end

    it 'Response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the :index template' do
      expect(response).to render_template(:show)
    end

    it 'Response body includes correct text' do
      expect(response.body).to include('Post #')
    end
  end
end

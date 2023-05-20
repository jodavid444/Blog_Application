require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET/index' do
    it 'Check if response status is correct' do
      get '/users/:id/posts'
      expect(response).to have_http_status(:ok)
    end
    it 'renders correct template' do
      get '/users/120/posts'
      expect(response).to render_template(:index)
    end

    it 'passes with status 200' do
      get '/users/120/posts'
      expect(response.status).to eql(200)
    end

    it 'includes correct text' do
      get '/users/120/posts'
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET/show' do
    it 'Check if response status is correct' do
      get '/users/:id/posts/:post_id'
      expect(response).to have_http_status(:ok)
    end
    it 'passes with status 200' do
      get '/users/100/posts/20'
      expect(response.status).to eql(200)
    end

    it 'include correct text' do
      get '/users/100/posts/2'
      expect(response.body).to include('Shows all the posts by a particular user')
    end
  end
end

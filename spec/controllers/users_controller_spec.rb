require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  context 'Make a get request to index' do
    before(:example) do
      get '/users'
    end

    it 'Response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the :index template' do
      expect(response).to render_template(:index)
    end

    it 'Response body includes correct text' do
      expect(response.body).to include('Users of website')
    end
  end

  context 'Make a get request to user' do
    before(:example) do
      @user = User.create(name: 'Fuad', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student',
                          posts_counter: 0)
      get "#{users_path}/#{@user.id}"
    end

    it 'Response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the :index template' do
      expect(response).to render_template(:show)
    end

    it 'Response body includes correct text' do
      expect(response.body).to include('Details of user:')
    end
  end
end

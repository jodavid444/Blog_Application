require 'rails_helper'

RSpec.describe 'Post index details page', type: :system do
  subject do
    @user = User.create(
      name: 'Lilly',
      posts_counter: 3,
      photo: 'https://images.unsplash.com/photo-1531123414780-f74242c2b052?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTJ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    )

    @post1 = Post.create(
      author: @user,
      title: 'Imposter Syndrome',
      text: 'A way of feeling bad about yourself, the feeling that you are not good enough. You can not achieve more',
      comments_counter: 1,
      likes_counter: 2
    )

    @post2 = Post.create(
      author: @user,
      title: 'Microverse',
      text: ' An entirely online full stack development school. Its entirely remote and you pay nothing until you land a job',
      comments_counter: 1,
      likes_counter: 2
    )
    @post3 = Post.create(
      author: @user,
      title: 'Hackarank',
      text: 'A nice place to practice coding. Coding challenges and have fun.',
      comments_counter: 1,
      likes_counter: 2
    )
    @post4 = Post.create(
      author: @user,
      title: 'Facebook',
      text: 'A social media giant that was started in the united state.',
      comments_counter: 1,
      likes_counter: 2
    )

    @comment = Comment.create(
      post: @post2,
      author: @user,
      text: 'I would love to attend that school'
    )
  end

  before { subject.save }
  describe 'testing for user post index page' do
    it 'should display the title of the post' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content(@post1.title)
    end

    it 'should displays the user profile.' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content(@user.name)
    end

    it 'should see how many comments a post has.' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content('Comments: 1')
    end

    it 'should see how many likes a post has.' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content('Likes: 2')
    end

    it 'should see some of the post body' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content(@post1.title)
    end

    it 'should see the username of each commentor.' do
      visit(user_post_path(@user, @post1))
      expect(page).to have_content('Lilly')
    end

    it 'should see the comment each commentor.' do
      visit(user_post_path(@user, @post1))
      page.has_content?('Lilly: I would love to attend that school.')
    end
  end
end

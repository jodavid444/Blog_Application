require 'rails_helper'

RSpec.describe 'Post index view', type: :system do
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

  describe 'Testing for user post index view', js: true do
    it 'should display the profile picture of the user.' do
      visit user_posts_path(@user, @post1)
      page.has_content?('Screenshot Image')
      expect(page).to have_css('img')
    end

    it 'should display the user name.' do
      visit user_posts_path(@user, @post1)
      expect(page).to have_content(@user.name)
    end

    it 'should display the number of posts by a user.' do
      visit user_posts_path(@user, @post1)
      page.has_content?("Number of posts: #{@user.posts_counter}")
    end

    it 'should display the title of the post' do
      visit user_posts_path(@user, @post1)
      expect(page).to have_content(@post1.title.to_s)
    end

    it 'should see some text of the post body' do
      visit user_posts_path(@user, @post1)
      expect(page).to have_content(@post1.text.to_s)
    end

    it 'should see the title text' do
      visit user_posts_path(@user, @post1)
      expect(page).to have_content('Imposter Syndrome')
    end

    it 'should see the number of comments per post.' do
      visit user_posts_path(@user, @post1)
      page.has_content?("Comments counter: #{@post1.comments_counter}")
    end

    it 'should see the number of likes per post.' do
      visit user_posts_path(@user, @post1)
      page.has_content?("Likes counter: #{@post1.likes_counter}")
    end

    it 'should see a section for pagination if there are more posts than fit on the view.' do
      visit user_posts_path(@user, @post1)
      page.has_button?('Pagination')
    end

    it 'When I click on a post, it should redirects me to that post show page.' do
      visit user_posts_path(@user, @post1)
      click_on(@post1.title)
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
  end
end

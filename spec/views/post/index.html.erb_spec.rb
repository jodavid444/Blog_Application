require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  describe 'Index page' do
    subject { User.create(name: 'Fuad', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU', bio: 'Solider', posts_counter: 0) }

    it 'Display posts view content' do
      post = Post.create(author_id: subject.id, title: 'Hello 1', text: 'This is my post', comments_counter: 0,
                         likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 2', text: 'This is my post 2', comments_counter: 0,
                  likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 3', text: 'This is my post 3', comments_counter: 0,
                  likes_counter: 0)
      Comment.create(author_id: subject.id, post_id: post.id, text: 'Test comment')
      visit user_posts_path(subject)

      expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU']")
      expect(page).to have_content('Fuad')
      expect(page).to have_content('Number of posts: 3')
      expect(page).to have_content('Hello 1')
      expect(page).to have_content('This is my post')
      expect(page).to have_content('Test comment')
      expect(page).to have_content('Comments: 1')
      expect(page).to have_content('Likes 0')

      click_link('Hello 1')
      sleep(5)
      expect(page).to have_current_path(user_post_path(subject, post))
    end
  end
end

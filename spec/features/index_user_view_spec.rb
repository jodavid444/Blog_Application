require 'rails_helper'

RSpec.describe 'User features', type: :system do
  subject do
    @user = User.create(
      name: 'Lilly',
      posts_counter: 3,
      bio: 'Web developer',
      photo: 'https://images.unsplash.com/photo-1531123414780-f74242c2b052?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTJ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    )
  end

  describe 'User Index page', js: true do
    it 'should displays the username of users.' do
      visit users_path(subject)
      expect(page).to have_content('Lilly')
    end

    it 'should displays the the profile picture of users.' do
      visit users_path(subject)
      page.has_content?('Screenshot Image')
      expect(page).to have_css('img')
    end

    it 'should display user bio' do
      visit users_path(subject)
      page.has_content?(@user.bio.to_s)
    end

    it 'should direct to the user show page when clicked.' do
      visit users_path(@user)
      expect(current_path).to eq(users_path(@user))
    end
  end
end

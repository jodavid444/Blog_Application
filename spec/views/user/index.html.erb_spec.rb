require 'rails_helper'

RSpec.describe 'Users index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user = User.create(name: 'Fuad',
                          photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU', bio: 'Solider', posts_counter: 0)
      visit users_path
    end

    it 'Display users index content' do
      expect(page).to have_content('Fuad')
      expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU']")
      expect(page).to have_content('Number of posts: 0')
      click_link('Fuad')
      sleep(5)
      expect(page).to have_current_path(user_path(@user))
    end
  end
end

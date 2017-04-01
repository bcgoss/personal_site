require 'rails_helper'

describe 'Posts' do
  context 'visitor' do
    it 'sees the content of a post' do
      owner = create :user
      post = create :post, user: owner, title: 'Post Title', body: 'This is a blog post' 

      visit root_path

      click_link 'Blog posts'
      click_link 'Post Title'

      expect(page).to have_content 'Post Title'
      expect(page).to have_content 'This is a blog post' 
    end
  end
end

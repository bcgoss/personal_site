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

  context 'user' do
    before :each do
      @member = create :user
      sign_in @member
    end
    it 'can create a new post' do
      visit posts_path

      click_link 'New post'
      fill_in 'Title', with: 'New title'
      fill_in 'Body', with: 'This is a post' 

      click_button 'Create Post'

      expect(page).to have_content 'New title'
      expect(page).to have_content 'This is a post'
    end

    it 'can edit a post' do
      @subject = create :post, title: 'A post', body: 'Original body', user: @member
      visit post_path @subject

      click_on 'Edit post'

      fill_in 'Title', with: 'New Title'
      fill_in 'Body', with: 'Updated body'

      click_button 'Update Post'

      expect(page).to have_content 'New Title'
      expect(page).to have_content 'Updated body'
    end
  end
end

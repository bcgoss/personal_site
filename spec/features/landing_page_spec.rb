require 'rails_helper'

describe 'Landing Page' do
  context 'visitor' do
    before :each do
      @owner = create :user
      create :project, name: 'Project 1', user: @owner
      create :post, title: 'First Post', user: @owner
    end 

    it 'can see links to public content' do
      visit root_path
      expect(page).to have_link 'Sign in'

      click_link 'Blog posts'
      expect(page).to have_content 'First Post'
      
      visit root_path
      click_link 'Projects'
      expect(page).to have_content 'Project 1' 
    end
  end

  context 'member' do
    before :each do
      @member = create :user
      sign_in @member
    end
  end
end

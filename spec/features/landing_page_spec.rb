require 'rails_helper'

describe 'Landing Page' do
  context 'visitor' do
    it 'can see links to public content' do
      visit root_path

      click_link 'Blog posts'
      expect(page).to have_content 'First Post'
      
      visit root_path
      click_link 'Projects'
      expect(page).to have_content 'Project 1' 
    end
  end
end

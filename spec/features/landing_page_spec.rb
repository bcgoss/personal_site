require 'rails_helper'

describe 'Landing Page' do
  context 'visitor' do
    it 'can see links to public content' do
      visit root_path

      expect(page).to have_link 'Blog posts'
      expect(page).to have_link 'Projects'
    end
  end
end

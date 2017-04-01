require 'rails_helper'

describe 'Projects' do
  context 'visitor' do
    it 'can see project details' do
      owner = create :user
      project = create :project, user: owner, name: 'Project 1', description: 'A project', link: 'link_to_project'

      visit root_path
      click_link 'Projects'
      click_link 'Project 1'

      expect(page).to have_content 'Project 1'
      expect(page).to have_content 'A project'
      expect(page).to have_link 'Repository', href: 'link_to_project'
    end
  end
end

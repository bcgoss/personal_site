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

  context 'user' do
    it 'can create a project' do
      owner = create :user
      sign_in owner

      visit root_path
      click_link 'Projects'
      click_link 'New project'

      fill_in 'Name', with: 'Project 1'
      fill_in 'Description', with: 'A project'
      fill_in 'Link', with: 'www.example.com'

      click_button 'Create Project'

      expect(page).to have_content 'Project 1'
    end
  end
end

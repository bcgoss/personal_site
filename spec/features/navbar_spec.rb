require 'rails_helper'

describe 'Navigation Bar' do
  context 'visitor' do
    it 'has a link to the root' do
      visit root_path
      expect(page).to have_link 'Home', href: root_path
      expect(page).to have_link 'Sign in', href: new_user_session_path
    end
  end

  context 'user' do
    it 'has a link to sign out' do
      me = create :user
      sign_in me
      visit root_path
      expect(page).to have_link 'Sign out', href: destroy_user_session_path
    end
  end
end

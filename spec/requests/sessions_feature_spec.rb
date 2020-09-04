require 'rails_helper'

RSpec.describe 'SessionsController', type: :system do
  context 'GET /sessions/new' do
    it "should display 'Login' text" do
      visit new_session_path
      expect(page).to have_content('Login')
    end

    it 'should reject sign in' do
      visit new_session_path
      within('form') do
        fill_in 'username', with: 'unknown'
      end
      click_button 'Sign in'
      expect(page).to have_content('the given username is not exist.')
    end
  end
end

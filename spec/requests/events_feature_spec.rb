require 'rails_helper'

RSpec.describe 'Event Feature', type: :feature do
  before :each do
    User.create(username: 'recca', name: 'Rebecca Yilma')
    visit sessions_new_path
    within('form') do
      fill_in 'username', with: 'recca'
    end
    click_button 'Sign in'
  end
  context 'GET /events' do
    it "should display 'Events' text)" do
      visit events_path
      expect(page).to have_content('Events')
    end
  end
end

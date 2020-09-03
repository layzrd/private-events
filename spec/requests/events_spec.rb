require 'rails_helper'

RSpec.describe 'Events', type: :system do
  before:each do
    login('recca')
  end
  context 'GET /events' do
    it "should display 'Events' text)" do
      visit events_path
      expect(page).to have_content('Events')
    end
  end
end

require 'rails_helper'

RSpec.describe SessionController, type: :system do
  before:each do
    fill_in "Login", :with => "recca"
    click_button "Submit"
  end
  context 'GET /session/new' do
    it "should display 'Login' text)" do
      visit session_new_path
      expect(page).to have_content('Login')
    end
  end
end

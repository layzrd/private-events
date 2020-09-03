require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before:each do
    User.create(id: 1, username: "recca", name: "Rebecca Yilma", created_at: "2020-08-31 20:01:50", updated_at: "2020-08-31 20:01:50")
  end
  context 'GET /users' do
    it "should display 'Users' text)" do
      visit users_path
      fill_in "Username", :with => "recca"
      click_button "Sign In"
      expect(page).to have_content('Users')
    end
  end
end

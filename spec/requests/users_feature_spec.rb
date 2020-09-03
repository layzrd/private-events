require 'rails_helper'

RSpec.describe "'Users feautre'", type: :feature do
  before do
    User.create(username: 'recca', name: 'Rebecca Yilma')
  end

  it "GET /users after sign in" do
    visit users_path
    within("form") do
      fill_in 'username', with: 'recca'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in user: Rebecca Yilma'
  end
end
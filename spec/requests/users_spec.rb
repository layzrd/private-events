# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  context 'GET /users' do
    it "should display 'Users' text)" do
      visit users_path
      expect(page).to have_content('Users')
    end
  end
end

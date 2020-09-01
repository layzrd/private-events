# This pulls in the config from spec/rails_helper.rb
# that's needed in order for the test to run.
require 'rails_helper'

# RSpec.describe, or just describe, is how all RSpec tests start.
# The 'Hello world' part is an arbitrary string and could have been anything.
# In this case we have something extra in our describe block, type: :system.
# The type: :system setting does have a functional purpose. It's what
# triggers RSpec to bring Capybara into the picture when we run the test.
RSpec.describe 'Hello world', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      # This is where Capybara starts to come into the picture. "visit" is a
      # Capybara method. hello_world_index_path is just a Rails routing
      # helper method and has nothing to do with RSpec or Capybara.
      visit session_new_path

      # The following is a mix of RSpec syntax and Capybara syntax. "expect"
      # and "to" are RSpec, "page" and "have_content" are Capybara. Newcomers
      # to RSpec and Capybara's English-sentence-like constructions often
      # have difficulty remembering when two words are separated by a dot or
      # an underscore or parenthesis, myself included. Don't worry, you'll
      # get familiar over time.
      expect(page).to have_content('New User')
    end
  end
end

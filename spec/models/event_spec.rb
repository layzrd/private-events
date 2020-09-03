require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { User.new(username: 'user1', name: 'User One') }
  context 'validations' do
    it "should be valid with valid attributes" do
      expect(Event.new(description: 'movie night @ Ree\'s home', creator: subject)).to be_valid
    end

    it "should not be valid without creator" do
      expect(Event.new(description: 'movie night @ Ree\'s home')).to_not be_valid
    end

    it "should not be valid without a username" do
      expect(Event.new(location: 'Addis, Ambo road', creator: subject)).to_not be_valid
    end

    it "should not valid with empty attributes" do
      expect(Event.new()).to_not be_valid
    end
  end
end

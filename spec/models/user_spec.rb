require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with 2 or more' do
    it 'orders them in reverse chronologically' do
      user = User.create(username: 'userx', name: 'User X')
      event1 = user.my_events.create!(description: 'event 1')
      event2 = user.my_events.create!(description: 'event 2')
      expect(user.reload.my_events).to eq([event1, event2])
    end
  end

  context 'User validations' do
    it "is not valid without a name" do
      expect(User.new(username: 'user1')).to_not be_valid
    end

    it "is not valid without a username" do
      expect(User.new(name: 'User One')).to_not be_valid
    end

    it "is valid with valid attributes" do
      expect(User.new(username: 'user1', name: 'User One')).to be_valid
    end
  end
end

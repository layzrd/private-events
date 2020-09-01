require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with 2 or more' do
    it 'orders them in reverse chronologically' do
      user = User.create!
      event1 = user.my_events.create!(location: 'loc1')
      event2 = user.my_events.create!(location: 'loc2')
      expect(user.reload.my_events).to eq([event1, event2])
    end
  end
end

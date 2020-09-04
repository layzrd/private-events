require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'should response OK for login page' do
    get :new
    expect(response.status).to eql(200)
  end
end

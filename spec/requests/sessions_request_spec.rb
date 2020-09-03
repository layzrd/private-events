require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  before :each do
    login('recca')
  end
  it 'should redirect to login page' do
    get :destroy
    expect(response).to redirect_to(session_new_path)
  end
end

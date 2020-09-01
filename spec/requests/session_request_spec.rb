require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  it 'should redirect to login page' do
    get :destroy
    expect(response).to redirect_to(session_new_path)
  end
end

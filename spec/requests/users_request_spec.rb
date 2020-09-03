require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    login('recca')
  end
  context 'GET index' do
    it 'should repsonse OK http ststus' do
      get :index
      expect(response.status).to eql(200)
    end

    it 'assigns @users' do
      user = User.create(username: 'user1', name: 'User One')
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end

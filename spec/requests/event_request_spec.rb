# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  context 'Events index' do
    it 'should display the index page' do
      get :index
      expect(response).to render_template('index')
    end

    it 'should display the form page' do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end
  end
end

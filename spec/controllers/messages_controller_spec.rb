require 'spec_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for :message }
  # let(:valid_session) { {} }

  describe 'POST create' do
    it 'response status is success' do
      post :create, message: valid_attributes, format: :js
      expect(response.status).to eq 200
    end
  end

end

require 'spec_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for :message }

  describe 'POST create' do
    let (:post_create) do
      post :create, message: valid_attributes, format: :js
    end

    it 'sould respond with success' do
      post_create
      expect(response).to be_success
    end
  end

end

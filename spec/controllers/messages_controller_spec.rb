require 'spec_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for :message }
  let(:valid_session) { {} }

  describe 'POST create' do
    it 'sould redirect to contact page' do
      post :create, {message: valid_attributes}, valid_session
      expect(response).to redirect_to(contact_path)
    end
  end

end

require 'spec_helper'

describe MessagesController do

  let(:valid_attributes) { FactoryGirl.attributes_for :message }
  let(:valid_session) { {} }

  describe 'POST create' do
    it 'sould redirect to contact page' do
      post :create, {message: valid_attributes}, valid_session
      response.should redirect_to(contact_path)
    end
  end

end

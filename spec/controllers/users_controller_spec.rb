require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  context 'user not logged in' do
    subject { response }

    describe 'GET new' do
      before { get :new, {} }
      it { is_expected.to redirect_to login_path }
    end
  end

  context 'user logged in' do
    before do
      login_user
      get :new, {}
    end

    describe 'GET new' do
      it 'assigns a new user as @user' do
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end
end

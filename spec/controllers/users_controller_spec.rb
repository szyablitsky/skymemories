require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create :user }
  let(:valid_attributes) { FactoryGirl.attributes_for :user }
  let(:valid_session) { {} }

  context "user not logged in" do

    subject { response }

    describe "GET new" do
      before { get :new, {}, valid_session }
      it { should redirect_to login_path }
    end

  end

  context "user logged in" do

    before do
      cookies[:remember_token] = user.remember_token
      user.update_attribute(:remember_token, User.encrypt(user.remember_token))
    end

    describe "GET new" do
      it "assigns a new user as @user" do
        get :new, {}, valid_session
        assigns(:user).should be_a_new(User)
      end
    end

  end

end

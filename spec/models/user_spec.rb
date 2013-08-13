require 'spec_helper'

describe User do
  
  it { should have_many :posts }

  it { should respond_to(:authenticate) }
  it { should ensure_length_of(:password).is_at_least(6) }

  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most(50) }
  
  it { should validate_presence_of :email }
#  it { should validate_uniqueness_of(:email).case_insensitive }

  let(:user) { FactoryGirl.create(:user) }

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      user.email = mixed_case_email
      user.save
      expect(user.reload.email).to eq mixed_case_email.downcase
    end
  end

  it "has a valid factory" do
    user.should be_valid
  end

end

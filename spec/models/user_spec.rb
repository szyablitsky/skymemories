require 'spec_helper'

describe User do
  
  it { is_expected.to have_many :posts }

  it { is_expected.to respond_to(:authenticate) }
  it { is_expected.to ensure_length_of(:password).is_at_least(6) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to ensure_length_of(:name).is_at_most(50) }
  
  it { is_expected.to validate_presence_of :email }
#  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

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
    expect(user).to be_valid
  end

end

require 'spec_helper'

describe "users/new" do

  it "renders register form" do
    render
    response.should have_content 'SignUp'
  end
end

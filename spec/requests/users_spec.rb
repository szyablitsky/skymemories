require 'spec_helper'

describe "Users" do
  describe "GET /users/new" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_new_path
      response.status.should be(200)
    end
  end
end

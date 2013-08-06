require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #new" do
      get("/users/new").should route_to("users#new")
    end

  end
end

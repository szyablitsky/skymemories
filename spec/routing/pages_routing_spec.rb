require "spec_helper"

describe PagesController do
  describe "routing" do

    it "routes to #home" do
      get("/").should route_to("pages#home")
    end

    it "routes to #about" do
      get("/about").should route_to("pages#about")
    end

    it "routes to #contact" do
      get("/contact").should route_to("pages#contact")
    end

  end
end

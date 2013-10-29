require "spec_helper"

describe PagesController do
  describe "routing" do

    it "routes to #home" do
      get("/").should route_to("pages#home")
    end

    it "routes to #home" do
      get("/en").should route_to("pages#home", :locale => "en")
    end

    it "routes to #home" do
      get("/he").should route_to("pages#home", :locale => "he")
    end

    it "routes to #about" do
      get("/about").should route_to("pages#about")
    end

    it "routes to #about" do
      get("/en/about").should route_to("pages#about", :locale => "en")
    end

    it "routes to #about" do
      get("/he/about").should route_to("pages#about", :locale => "he")
    end

    it "routes to #contact" do
      get("/contact").should route_to("pages#contact")
    end

    it "routes to #contact" do
      get("/en/contact").should route_to("pages#contact", :locale => "en")
    end

    it "routes to #contact" do
      get("/he/contact").should route_to("pages#contact", :locale => "he")
    end

  end
end

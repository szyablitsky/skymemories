require 'spec_helper'

describe "movies/index" do
  before(:each) do
    assign(:movies, [
      stub_model(Movie,
        :vimeo_id => 1,
        :locale => "Locale",
        :main => false
      ),
      stub_model(Movie,
        :vimeo_id => 1,
        :locale => "Locale",
        :main => false
      )
    ])
  end

  it "renders a list of movies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Locale".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

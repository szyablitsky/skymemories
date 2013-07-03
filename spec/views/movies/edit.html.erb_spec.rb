require 'spec_helper'

describe "movies/edit" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :vimeo_id => 1,
      :locale => "MyString",
      :main => false
    ))
  end

  it "renders the edit movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do
      assert_select "input#movie_vimeo_id[name=?]", "movie[vimeo_id]"
      assert_select "input#movie_locale[name=?]", "movie[locale]"
      assert_select "input#movie_main[name=?]", "movie[main]"
    end
  end
end

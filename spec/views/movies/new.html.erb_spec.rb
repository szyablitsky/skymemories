require 'spec_helper'

describe "movies/new" do
  before(:each) do
    assign(:movie, stub_model(Movie,
      :vimeo_id => 1,
      :locale => "MyString",
      :main => false
    ).as_new_record)
  end

  it "renders new movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movies_path, "post" do
      assert_select "input#movie_vimeo_id[name=?]", "movie[vimeo_id]"
      assert_select "input#movie_locale[name=?]", "movie[locale]"
      assert_select "input#movie_main[name=?]", "movie[main]"
    end
  end
end

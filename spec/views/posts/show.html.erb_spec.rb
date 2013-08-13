require 'spec_helper'

describe "posts/show" do
  before(:each) do
    @user = stub_model(User, name: 'User')
    @post = assign(:post, stub_model(Post,
      :title => "Title",
      :content => "MyText",
      :published => false,
      :user => @user
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(/User/)
  end
end

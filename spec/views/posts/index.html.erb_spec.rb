require 'spec_helper'

describe "posts/index" do
  # ========================================
  # does not work with will_paginate
  # ========================================

  # before(:each) do
  #   @user = stub_model(User, name: 'User')
  #   assign(:posts, [
  #     stub_model(Post,
  #       :title => "Title",
  #       :content => "MyText",
  #       :published => false,
  #       :user => @user
  #     ),
  #     stub_model(Post,
  #       :title => "Title",
  #       :contnent => "MyText",
  #       :published => false,
  #       :user => @user
  #     )
  #   ])
  # end

  # it "renders a list of posts" do
  #   render
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => "Title".to_s, :count => 2
  #   assert_select "tr>td", :text => "MyText".to_s, :count => 2
  #   assert_select "tr>td", :text => false.to_s, :count => 2
  #   assert_select "tr>td", :text => @user.name.to_s, :count => 2
  # end
end

require 'spec_helper'

describe PostsController do

  let(:the_post) { FactoryGirl.create :post }
  let(:valid_attributes) { FactoryGirl.attributes_for :post }
  let(:valid_session) { {} }

  let(:user) { FactoryGirl.create :user }
  before do
    cookies[:remember_token] = user.remember_token
    user.update_attribute(:remember_token, User.encrypt(user.remember_token))
  end


  describe "GET index" do
    it "assigns all posts as @posts" do
      get :index, {}, valid_session
      assigns(:posts).should eq([the_post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      get :show, {:id => the_post.to_param}, valid_session
      assigns(:post).should eq(the_post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new, {}, valid_session
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      get :edit, {:id => the_post.to_param}, valid_session
      assigns(:post).should eq(the_post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {:post => valid_attributes}, valid_session
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}, valid_session
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, {:post => valid_attributes}, valid_session
        response.should redirect_to(Post.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { "title" => "invalid value" }}, valid_session
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        Post.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => the_post.to_param, :post => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested post as @post" do
        put :update, {:id => the_post.to_param, :post => valid_attributes}, valid_session
        assigns(:post).should eq(the_post)
      end

      it "redirects to the post" do
        put :update, {:id => the_post.to_param, :post => valid_attributes}, valid_session
        response.should redirect_to(the_post)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => the_post.to_param, :post => { "title" => "invalid value" }}, valid_session
        assigns(:post).should eq(the_post)
      end

      it "re-renders the 'edit' template" do
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => the_post.to_param, :post => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      the_post.save
      expect {
        delete :destroy, {:id => the_post.to_param}, valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, {:id => the_post.to_param}, valid_session
      response.should redirect_to(posts_url)
    end
  end

end

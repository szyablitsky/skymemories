require 'spec_helper'

RSpec.describe MoviesController, type: :controller do

  let(:movie) { FactoryGirl.create :movie }
  let(:valid_attributes) { FactoryGirl.attributes_for :movie }
  let(:valid_session) { { remember_token: FactoryGirl.attributes_for(:user)[:remember_token] } }

  let(:user) { FactoryGirl.create :user }
  before do
    cookies[:remember_token] = user.remember_token
    user.update_attribute(:remember_token, User.encrypt(user.remember_token))
  end

  describe "GET index" do
    it "assigns all movies as grouped @locales array" do
      get :index, {}, valid_session
      expect(assigns(:locales)).to eq({}) # [en:[movie]]
    end
  end

  describe "GET new" do
    it "assigns a new movie as @movie" do
      get :new, {}, valid_session
      expect(assigns(:movie)).to be_a_new(Movie)
    end
  end

  describe "GET edit" do
    it "assigns the requested movie as @movie" do
      get :edit, {:id => movie.to_param}, valid_session
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Movie" do
        expect {
          post :create, {:movie => valid_attributes}, valid_session
        }.to change(Movie, :count).by(1)
      end

      it "assigns a newly created movie as @movie" do
        post :create, {:movie => valid_attributes}, valid_session
        expect(assigns(:movie)).to be_a(Movie)
        expect(assigns(:movie)).to be_persisted
      end

      it "redirects to movies list" do
        post :create, {:movie => valid_attributes}, valid_session
        expect(response).to redirect_to(movies_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved movie as @movie" do
        allow_any_instance_of(Movie).to receive(:save).and_return(false)
        post :create, {:movie => { "vimeo_id" => "invalid value" }}, valid_session
        expect(assigns(:movie)).to be_a_new(Movie)
      end

      it "re-renders the 'new' template" do
        allow_any_instance_of(Movie).to receive(:save).and_return(false)
        post :create, {:movie => { "vimeo_id" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested movie" do
        # expect(movie).to receive(:update).with({ "vimeo_id" => "1" })
        expect {
          put :update, {:id => movie.to_param, :movie => { "vimeo_id" => "1" }}, valid_session
          movie.reload
        }.to change { movie.vimeo_id }
      end

      it "assigns the requested movie as @movie" do
        put :update, {:id => movie.to_param, :movie => valid_attributes}, valid_session
        expect(assigns(:movie)).to eq(movie)
      end

      it "redirects to the movies list" do
        put :update, {:id => movie.to_param, :movie => valid_attributes}, valid_session
        expect(response).to redirect_to(movies_path)
      end
    end

    describe "with invalid params" do
      it "assigns the movie as @movie" do
        allow_any_instance_of(Movie).to receive(:save).and_return(false)
        put :update, {:id => movie.to_param, :movie => { "vimeo_id" => "invalid value" }}, valid_session
        expect(assigns(:movie)).to eq(movie)
      end

      it "re-renders the 'edit' template" do
        allow_any_instance_of(Movie).to receive(:save).and_return(false)
        put :update, {:id => movie.to_param, :movie => { "vimeo_id" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested movie" do
      movie.save
      expect {
        delete :destroy, {:id => movie.to_param}, valid_session
      }.to change(Movie, :count).by(-1)
    end

    it 'redirects to the movies list' do
      delete :destroy, {:id => movie.to_param}, valid_session
      expect(response).to redirect_to(movies_url)
    end
  end

end

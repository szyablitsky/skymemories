require 'spec_helper'

describe MoviesController do
  
  let(:movie) { FactoryGirl.create :movie }
  let(:valid_attributes) { FactoryGirl.attributes_for :movie }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all movies as grouped @locales array" do
      get :index, {}, valid_session
      assigns(:locales).should eq({}) # [en:[movie]]
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
        assigns(:movie).should be_a(Movie)
        assigns(:movie).should be_persisted
      end

      it "redirects to movies list" do
        post :create, {:movie => valid_attributes}, valid_session
        response.should redirect_to(movies_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved movie as @movie" do
        # Trigger the behavior that occurs when invalid params are submitted
        Movie.any_instance.stub(:save).and_return(false)
        post :create, {:movie => { "vimeo_id" => "invalid value" }}, valid_session
        assigns(:movie).should be_a_new(Movie)
      end

      it "redirects to movies list" do
        # Trigger the behavior that occurs when invalid params are submitted
        Movie.any_instance.stub(:save).and_return(false)
        post :create, {:movie => { "vimeo_id" => "invalid value" }}, valid_session
        response.should redirect_to(movies_path)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested movie" do
        # Assuming there are no other movies in the database, this
        # specifies that the Movie created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Movie.any_instance.should_receive(:update).with({ "vimeo_id" => "1" })
        put :update, {:id => movie.to_param, :movie => { "vimeo_id" => "1" }}, valid_session
      end

      it "assigns the requested movie as @movie" do
        put :update, {:id => movie.to_param, :movie => valid_attributes}, valid_session
        assigns(:movie).should eq(movie)
      end

      it "redirects to the movies list" do
        put :update, {:id => movie.to_param, :movie => valid_attributes}, valid_session
        response.should redirect_to(movies_path)
      end
    end

    describe "with invalid params" do
      it "assigns the movie as @movie" do
        # Trigger the behavior that occurs when invalid params are submitted
        Movie.any_instance.stub(:save).and_return(false)
        put :update, {:id => movie.to_param, :movie => { "vimeo_id" => "invalid value" }}, valid_session
        assigns(:movie).should eq(movie)
      end

      it "redirects to movies list" do
        # Trigger the behavior that occurs when invalid params are submitted
        Movie.any_instance.stub(:save).and_return(false)
        put :update, {:id => movie.to_param, :movie => { "vimeo_id" => "invalid value" }}, valid_session
        response.should redirect_to(movies_path)
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

    it "redirects to the movies list" do
      delete :destroy, {:id => movie.to_param}, valid_session
      response.should redirect_to(movies_url)
    end
  end

end

require 'spec_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie) { FactoryGirl.create(:movie) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:movie) }

  before { login_user }

  describe 'GET index' do
    it 'assigns all movies as grouped @locales array' do
      get :index, {}
      expect(assigns(:locales)).to eq({})
    end
  end

  describe 'GET new' do
    it 'assigns a new movie as @movie' do
      get :new, {}
      expect(assigns(:movie)).to be_a_new(Movie)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested movie as @movie' do
      get :edit, { id: movie.to_param }
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      let(:create_movie) { post :create, { movie: valid_attributes } }

      it 'creates a new Movie' do
        expect { create_movie }.to change(Movie, :count).by(1)
      end

      it 'assigns a newly created movie as @movie' do
        create_movie
        expect(assigns(:movie)).to be_a(Movie)
        expect(assigns(:movie)).to be_persisted
      end

      it 'redirects to movies list' do
        create_movie
        expect(response).to redirect_to(movies_path)
      end
    end

    describe 'with invalid params' do
      let(:create_movie) do
        post :create, { movie: { 'vimeo_id' => 'invalid value' } }
      end

      before { create_movie }

      it 'assigns a newly created but unsaved movie as @movie' do
        expect(assigns(:movie)).to be_a_new(Movie)
      end

      it 're-renders the "new" template' do
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested movie' do
        expect do
          put :update, { id: movie.to_param, movie: { 'vimeo_id' => '1' } }
          movie.reload
        end.to change { movie.vimeo_id }
      end

      it 'assigns the requested movie as @movie' do
        put :update, { id: movie.to_param, movie: valid_attributes }
        expect(assigns(:movie)).to eq(movie)
      end

      it 'redirects to the movies list' do
        put :update, { id: movie.to_param, movie: valid_attributes }
        expect(response).to redirect_to(movies_path)
      end
    end

    describe 'with invalid params' do
      let(:update_movie) do
        put :update, { id: movie.to_param, movie: { 'vimeo_id' => 'invalid value' } }
      end

      it 'assigns the movie as @movie' do
        update_movie
        expect(assigns(:movie)).to eq(movie)
      end

      it 're-renders the "edit" template' do
        update_movie
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    let(:destroy_movie) { delete :destroy, { id: movie.to_param } }

    it 'destroys the requested movie' do
      movie.save
      expect { destroy_movie }.to change(Movie, :count).by(-1)
    end

    it 'redirects to the movies list' do
      destroy_movie
      expect(response).to redirect_to(movies_url)
    end
  end
end

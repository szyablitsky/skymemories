require 'spec_helper'

RSpec.describe PostsController, type: :controller do
  let(:the_post) { FactoryGirl.create :post }
  let(:valid_attributes) { FactoryGirl.attributes_for :post }

  before { login_user }

  describe 'GET index' do
    it 'assigns all posts as @posts' do
      get :index, {}
      expect(assigns(:posts)).to eq([the_post])
    end
  end

  describe 'GET show' do
    it 'assigns the requested post as @post' do
      get :show, { id: the_post.to_param }
      expect(assigns(:post)).to eq(the_post)
    end
  end

  describe 'GET new' do
    it 'assigns a new post as @post' do
      get :new, {}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested post as @post' do
      get :edit, { id: the_post.to_param }
      expect(assigns(:post)).to eq(the_post)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Post' do
        expect do
          post :create, { post: valid_attributes }
        end.to change(Post, :count).by(1)
      end

      it 'assigns a newly created post as @post' do
        post :create, { post: valid_attributes }
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it 'redirects to the created post' do
        post :create, { post: valid_attributes }
        expect(response).to redirect_to(Post.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved post as @post' do
        allow_any_instance_of(Post).to receive(:save).and_return(false)
        post :create, { post: { 'title' => 'invalid value' } }
        expect(assigns(:post)).to be_a_new(Post)
      end

      it 're-renders the "new" template' do
        allow_any_instance_of(Post).to receive(:save).and_return(false)
        post :create, { post: { 'title' => 'invalid value' } }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested post' do
        expect do
          put :update, { id: the_post.to_param, post: { 'title' => 'New title' } }
          the_post.reload
        end.to change { the_post.title }
      end

      it 'assigns the requested post as @post' do
        put :update, { id: the_post.to_param, post: valid_attributes }
        expect(assigns(:post)).to eq(the_post)
      end

      it 'redirects to the post' do
        put :update, { id: the_post.to_param, post: valid_attributes }
        expect(response).to redirect_to(the_post)
      end
    end

    describe 'with invalid params' do
      it 'assigns the post as @post' do
        allow_any_instance_of(Post).to receive(:save).and_return(false)
        put :update, { id: the_post.to_param, post: { 'title' => 'invalid value' } }
        expect(assigns(:post)).to eq(the_post)
      end

      it 're-renders the "edit" template' do
        allow_any_instance_of(Post).to receive(:save).and_return(false)
        put :update, { id: the_post.to_param, post: { 'title' => 'invalid value' } }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested post' do
      the_post.save
      expect do
        delete :destroy, { id: the_post.to_param }
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      delete :destroy, { id: the_post.to_param }
      expect(response).to redirect_to(posts_url)
    end
  end

end

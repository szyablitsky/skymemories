Skymemories::Application.routes.draw do
  scope '(:locale)', locale: /ru|en|he/ do
    root 'pages#home'
    get 'about', to: 'pages#about'
    get 'vacancies', to: 'pages#vacancies'
    resources :messages, only: [:create]
  end

  resources :blog, only: [:index, :show]

  resources :movies, except: [:show] do
    post 'order', on: :collection
  end
  resources :testimonials, only: [:index, :create, :update, :destroy]
  resources :posts
  resources :users

  resources :sessions, only: [:create]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
end

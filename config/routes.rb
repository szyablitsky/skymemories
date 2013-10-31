Skymemories::Application.routes.draw do

  scope '(:locale)', locale: /ru|en|he/ do  
    root 'pages#home'
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    resources :messages, only: [:create]
  end
  
  resources :blog, only: [:index, :show]

  resources :movies, except: [:show]
  resources :posts
  resources :users

  resources :sessions, only: [:new, :create, :destroy]
  match 'login',  to: 'sessions#new', via: :get
  match 'logout', to: 'sessions#destroy', via: :delete

end

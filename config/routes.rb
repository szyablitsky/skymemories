Skymemories::Application.routes.draw do

  scope '(:locale)', locale: /ru|en|he/ do  
    root 'pages#home'
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
  end
  
  resources :movies, except: [:show]
  resources :posts
  
  resources :users
  match 'register', to: 'users#new', via: :get
  
  resources :sessions, only: [:new, :create, :destroy]
  match 'login',  to: 'sessions#new', via: :get
  match 'logout', to: 'sessions#destroy', via: :delete

end

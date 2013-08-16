Skymemories::Application.routes.draw do
  
  root 'pages#home'
  get 'contact', to: 'pages#contact'
  
  resources :movies, except: [:show, :new, :edit]
  resources :posts
  
  resources :users
  match 'register', to: 'users#new', via: :get
  
  resources :sessions, only: [:new, :create, :destroy]
  match 'login',  to: 'sessions#new', via: :get
  match 'logout', to: 'sessions#destroy', via: :delete

end

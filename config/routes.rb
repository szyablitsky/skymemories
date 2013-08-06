Skymemories::Application.routes.draw do
  
  root 'pages#home'

  get 'contact', to: 'pages#contact'
  
  resources :movies
  resources :posts

  get 'users/new'
  get 'register', to: 'users#new'

end

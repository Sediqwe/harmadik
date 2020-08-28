Rails.application.routes.draw do
  get 'belepes', to: 'belepes#index'
  post 'belepes', to: 'belepes#aktival'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/about', to: 'pages#about' 
  get '/regisztralas', to: 'users#new'
  resources :users, except: [ :new ]
  root 'pages#index'

  resources :articles





end

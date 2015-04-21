Rails.application.routes.draw do
  
  get 'users/show'

  devise_for :users

  resources :users, only: [:show] 

  get 'about' => 'welcome#about'
  root to: 'welcome#index'

  resources :topics do
    resources :bookmarks, only: [:edit, :update, :create, :new, :destroy]
  end

  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end

  post :incoming, to: 'incoming#create'
 
end

Rails.application.routes.draw do
  
  devise_for :users

  get 'about' => 'welcome#about'
  root to: 'welcome#index'

  resources :topics do
    resources :bookmarks, only: [:edit, :update, :create, :new, :destroy]
      resources :likes, only: [:create, :destroy]
  end

  post :incoming, to: 'incoming#create'
 
end

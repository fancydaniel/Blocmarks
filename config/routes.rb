Rails.application.routes.draw do
  
  devise_for :users

  get 'about' => 'welcome#about'
  root to: 'welcome#index'

  resources :topics do
    resources :bookmarks, only: [:show, :create, :new]
  end

  post :incoming, to: 'incoming#create'
 
end

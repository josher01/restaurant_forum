Rails.application.routes.draw do
  devise_for :users 
  
  resources :restaurants , only: [:show, :index] do
    resources :comments, only: [:create,:show, :destroy] do
      member do
        post :like
        post :unlike
      end
    end

    collection do
      get :feeds
    end

    member do
      get :dashboard
      post :favorite
      post :unfavorite
      post :like
      post :unlike
    end
  end

  resources :categories , only: [:show]
  resources :users, only: [:show, :edit, :update]

  root 'restaurants#index'


  namespace :admin do
    resources :restaurants
    resources :categories
    root 'restaurants#index'  
  end
end

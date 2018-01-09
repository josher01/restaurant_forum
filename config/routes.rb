Rails.application.routes.draw do
  root 'restaurants#index'
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
      get :ranking
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

  namespace :admin do
    resources :restaurants
    resources :categories
    root 'restaurants#index'  
  end
end

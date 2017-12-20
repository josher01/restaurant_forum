Rails.application.routes.draw do

  devise_for :users
  resources :restaurants , only: [:show, :index] do
    resources :comments, only: [:index, :new, :create,:show]
  end
  resources :comments, only: [:destroy]
  resources :categories , only: [:show]

  root 'restaurants#index'


  namespace :admin do
    resources :restaurants
    resources :categories
    root 'restaurants#index'  
  end
end

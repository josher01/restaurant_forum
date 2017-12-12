Rails.application.routes.draw do

  devise_for :users
  resources :restaurants , only: [:show, :index]
  resources :categories , only: [:show, :index]
  root 'restaurants#index'


  namespace :admin do
    resources :restaurants
    resources :categories
    root 'restaurants#index'  
  end
end

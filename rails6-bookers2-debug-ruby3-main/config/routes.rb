Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  
  #get 'favorites/create'
  #get 'favorites/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
  
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  # ネストさせる
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  get "search" => "searches#search"
end
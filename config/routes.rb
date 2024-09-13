Rails.application.routes.draw do


  devise_for :users
  root to: "homes#top"
  get 'home/about' => "homes#about", as: 'about'

  resources :books, only: [:create, :new, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:edit, :show, :update, :create, :index]
end

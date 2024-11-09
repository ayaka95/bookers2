Rails.application.routes.draw do


  devise_for :users
  root to: "homes#top"
  get 'home/about' => "homes#about", as: 'about'

  resources :books, only: [:create, :new, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:edit, :show, :update, :create, :index]
  resources :groups, only: [:new, :create, :index, :edit, :update, :show] do
    resource :group_users, only: [:create]
  end
end

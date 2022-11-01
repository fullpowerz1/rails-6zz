Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
  get "home/about"=>"homes#about"
end
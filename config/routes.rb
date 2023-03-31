Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  
  # resources :users, only: [:index, :show, :edit]
  # resources :books, only: [:index, :show, :edit, :create]
  resources :users
  resources :books
  
  get "/home/about" => "homes#about", as: "about"
  
end

Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :create, :update]
  resources :books, only: [:new, :index, :show, :edit, :create]
  resources :user_images, only: [:edit, :index, :show, :destroy]
  get '/homes/about', to: 'homes#about', as: 'about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

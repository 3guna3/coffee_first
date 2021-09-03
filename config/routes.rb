Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
  resources :shops, only: [:create, :show, :index]
  resources :beans, only: [:create, :show, :index]
  resources :user, only: [:show, :edit]
end

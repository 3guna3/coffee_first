Rails.application.routes.draw do
  root "shops#index"
  resources :shops, only: [:create, :show, :index]
  resources :beans, only: [:create, :show, :index]
end

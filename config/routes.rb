Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "beans_comments#index"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :users
  put "users/:id/hide", to: "users#hide", as: "users_hide"
  get "users/:id/profile", to: "users#show", as: "user_profile"
  resources :shops do
    resources :shop_comments
  end
  resources :beans do
    resources :beans_comments
  end
  resources :users, only: [:show, :edit]

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    get "users/sign_out" => "devise/sessions#destroy"
  end
end

Rails.application.routes.draw do
  root "beans_comments#index"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
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

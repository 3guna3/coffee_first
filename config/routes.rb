Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  get "users/:id/profile", to: "users#show", as: "user_profile"
  root "shops#index"
  resources :shops, only: [:create, :show, :index]
  resources :beans, only: [:create, :show, :index]
  resources :users, only: [:show, :edit]

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end

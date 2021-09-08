Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root "shops#index"
  resources :shops, only: [:create, :show, :index]
  resources :beans, only: [:create, :show, :index]
  resources :user, only: [:show, :edit]

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end

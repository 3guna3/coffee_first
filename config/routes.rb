Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  get "users/:id/profile", to: "users#show", as: "user_profile"
  root "shops#index"
  resources :shops do
    resources :shop_comments
  end
  resources :beans do
    collection do
      get "search"
    end
    resources :beans_comments
  end
  resources :users, only: [:show, :edit]

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end

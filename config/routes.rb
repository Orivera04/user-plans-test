Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }, path_prefix: "auth"

  resources :home

  resources :users

  resources :plans

  resources :pagos

  root to: "home#index"

end

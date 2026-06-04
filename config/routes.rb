Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :resumes

  get "/dashboard", to: "pages#dashboard", as: :dashboard

  resources :chats, only: [:new, :create, :destroy] do
    resources :messages, only: [:create]
  end
end

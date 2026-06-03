Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :resumes, except: [:destroy]

  get "/dashboard", to: "pages#dashboard", as: :dashboard

  resources :chats, only: [:new, :create] do
    resources :messages, only: [:create]
  end
end

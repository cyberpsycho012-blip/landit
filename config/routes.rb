Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "pages/dashboard", to: "pages#new"
  get "pages/dashboard", to: "pages#dashboard"
  post "pages/dashboard", to: "pages#dashboard"
  post "messages/new", to: "messages#create"
  post "chats/new", to: "chats#create"
  get "chats/show/:id", to: "chats#show"


  resources :resumes, only: [:new, :create, :show, :index, :edit, :update]

end

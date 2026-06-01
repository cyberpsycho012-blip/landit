Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "pages/dashboard", to: "pages#new"
  get "pages/dashboard", to: "pages#dashboard"
  post "pages/dashboard", to: "pages#dashboard"
  post "messages/new", to: "messages#create"
  post "chats/new", to: "chats#create"
  get "chats/show/:id", to: "chats#show"
  post "resumes", to: "resumes#create"
  get "resumes/:id/edit", to: "resumes#edit"
  patch "resumes/:id", to: "resumes#update"

end

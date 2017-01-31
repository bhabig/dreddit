Rails.application.routes.draw do
  root 'welcome#hello'
  resources :sessions, only: [:new, :create, :destroy]
  resources :tags
  resources :posts
  resources :users
end

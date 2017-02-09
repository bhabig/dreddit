Rails.application.routes.draw do
  root 'welcome#hello'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :users do
    resources :posts
  end
  resources :tags
end

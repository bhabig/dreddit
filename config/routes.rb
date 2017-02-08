Rails.application.routes.draw do
  root 'welcome#hello'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :posts do
    resources :tags
  end
end

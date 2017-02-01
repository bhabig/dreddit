Rails.application.routes.draw do
  root 'welcome#hello'
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :posts do
    resources :tags, only: [:index, :show]
  end

  resources :users
end

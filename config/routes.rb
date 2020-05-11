Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
    root to: "tasks#index"
    resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
    
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    
    get "signup", to: "users#new"
    resources :users, only: [:new, :create]
    
    
end

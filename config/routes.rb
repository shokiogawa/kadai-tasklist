Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
    root to: "tasks#index"
    resources :tasks
    
    get "signup", to: "users#index"
    resources :users, only: [:index, :show, :new, :create]
    
    
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  resources :users, only: [:show, :new, :create, :destroy]
  resources :dairies, only: [:new, :show, :create, :edit, :destroy]
  resources :microposts, only: [:new, :show, :create, :destroy]
  resources :hobbies, only: [:index, :new, :create, :destroy]
end

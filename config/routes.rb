Rails.application.routes.draw do
<<<<<<< HEAD

  resources :users do
    resources :posts do
          resources :likes
          resources :comments
    end
=======
  devise_for :users
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    get '/users/:user_id/posts', to: 'posts#index'
    post '/comments', to: 'comments#create'
    get '/users/:user_id/posts/:post_id/comments', to: 'comments#index'
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [ :index, :new, :create, :destroy] 
    resources :likes, only: [:create]
>>>>>>> development
  end

  root "users#index"

end

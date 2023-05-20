Rails.application.routes.draw do

  resources :users do
    resources :posts do
          resources :likes
          resources :comments
    end
  end

  root "users#index"

end

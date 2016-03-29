Rails.application.routes.draw do
   root 'home#index'

   resources :sessions, only: [:new, :create, :destroy]
   match '/signup',  to: 'users#new',            via: 'get'
   match '/signin',  to: 'sessions#new',         via: 'get'
   match '/signout', to: 'sessions#destroy',     via: 'delete'
   resources :users do
     resources :posts
   end

  resources :posts do
    resources :comments
  end

   resources :comments do
     resources :inner_comments
   end

end

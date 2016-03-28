Rails.application.routes.draw do
   root 'home#index'

   resources :sessions, only: [:new, :create, :destroy]
   match '/signup',  to: 'users#new',            via: 'get'
   match '/signin',  to: 'sessions#new',         via: 'get'
   match '/signout', to: 'sessions#destroy',     via: 'delete'
   resources :users

end

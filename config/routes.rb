Rails.application.routes.draw do


  post '/users/new', to: 'users#new'
  get '/users/user_ratings', to: 'users#user_ratings', as: 'user_ratings'
  resources :users, except: [:index] do
    resources :ratings, only: [:index]
  end
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/sessions/login', to: 'sessions#login', as: 'login'
  post '/sessions/login', to: 'sessions#create' 
  get '/sessions/logout', to: 'sessions#destroy', as: 'logout'
  root to: 'sessions#welcome', as: 'welcome'
  get 'authorized', to: 'sessions#page_requires_login', as: 'require_login'
  get '/ratings/expensive_eateries', to: 'ratings#expensive_eateries', as: 'expensive_eats'
  get '/ratings/cheap_eateries', to: 'ratings#cheap_eateries', as: 'cheap_eats'
  resources :eateries, only: [:index, :show] do
    resources :ratings, only: [:new]
  end
  post '/ratings/new', to: 'ratings#new'
  resources :ratings, except: [:index]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

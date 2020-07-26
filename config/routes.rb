Rails.application.routes.draw do


  post '/users/new', to: 'users#new'
  resources :users, except: [:index]
  get '/sessions/login', to: 'sessions#login', as: 'login'
  post '/sessions/login', to: 'sessions#create' 
  get '/sessions/logout', to: 'sessions#logout', as: 'logout'
  get '/welcome', to: 'sessions#welcome', as: 'welcome'
  get 'authorized', to: 'sessions#page_requires_login', as: 'require_login'
  get '/eateries/favorite_eateries', to: 'eateries#favorite_eateries', as: 'top_five'
  get '/eateries/expensive_eateries', to: 'eateries#expensive_eateries', as: 'expensive_eats'
  get '/eateries/cheap_eateries', to: 'eateries#cheap_eateries', as: 'cheap_eats'
  resources :eateries, only: [:index, :show]
  post '/ratings/new', to: 'ratings#new'
  resources :ratings, except: [:index]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  get '/eateries/favorite_eateries', to: 'eateries#favorite_eateries', as: 'top_five'
  get '/eateries/expensive_eateries', to: 'eateries#expensive_eateries', as: 'expensive_eats'
  get '/eateries/cheap_eateries', to: 'eateries#cheap_eateries', as: 'cheap_eats'
  resources :eateries, only: [:index, :show]
  get '/users/login', to: 'users#login', as: 'login'
  get '/users/logout', to: 'users#logout', as: 'logout'
  resources :users, except: [:index] 
  resources :ratings, except: [:index]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

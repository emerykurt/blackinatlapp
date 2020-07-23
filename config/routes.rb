Rails.application.routes.draw do

  get '/eateries/favorite_eateries', to: 'eateries#favorite_eateries', as: 'top_five'
  resources :eateries, only: [:index, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

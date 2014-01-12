DocumentReader::Application.routes.draw do
 root to: 'high_voltage/pages#show', id: 'homepage'

 get 'signup' , to:'users#new', as: 'signup'
 get 'login',   to:'sessions#new', as: 'login' 
 get 'logout',  to:'sessions#destroy', as: 'logout'
 
 resources :users, only: [:new, :create]
 resources :sessions, only: [:new, :create, :destroy]
end

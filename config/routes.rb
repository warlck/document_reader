DocumentReader::Application.routes.draw do
 root to: 'high_voltage/pages#show', id: 'homepage'
 
 get 'signup' , to:'users#new', as: 'signup'

 resources :users, only: [:new, :create]
end

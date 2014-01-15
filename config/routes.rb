DocumentReader::Application.routes.draw do
 root to: 'reader#show'

 get 'signup' , to:'users#new', as: 'signup'
 get 'login',   to:'sessions#new', as: 'login' 
 get 'logout',  to:'sessions#destroy', as: 'logout'
 get 'documents/get/:id', to: "documents#get", as: 'download' 
 get 'browse/:folder_id', to: "libraries#browse", as: "browse"
 get 'browse/:folder_id/new_folder', to: "folders#new", as: "new_sub_folder"
 get 'browse/:folder_id/new_file', to: "documents#new", as: "new_sub_file"
 get 'browse/:folder_id/rename', to: "folders#edit", as: "rename_folder"
 
 resources :users, only: [:new, :create]
 resources :sessions, only: [:new, :create, :destroy]
 resources :password_resets, only: [:new, :create, :edit, :update]
 resources :documents, only: [:new, :create, :destroy]
 resources :libraries, only: [:show]
 resources :folders, only: [:new, :create, :show, :edit, :update]
 resource  :reader, only: [:show]

end
	
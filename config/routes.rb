Rails.application.routes.draw do  
  root to: redirect('/homepage', status: 302)

  get 'homepage', to: 'pages#homepage', as: 'homepage'
  get 'discover', to: 'pages#discover', as: 'discover'
  get 'profile/:username', to: 'pages#show_profile', as: 'show_profile'
  get 'user_search', to: 'pages#user_search', as: 'user_search'
  get 'comic_search', to: 'pages#comic_search', as: 'comic_search'
  
  get 'register', to: 'register#new_user', as: 'new_user'
  post 'create', to: 'register#create', as: 'register_create' 
 
  post 'request', to: 'session#new_request', as: 'new_request'
  post 'promote_user', to: 'session#promote_user', as: 'promote_user'
  get 'login', to: 'session#new_session', as: 'login'
  post 'create_session', to: 'session#create', as: 'session_create'
  get 'profile', to: 'session#profile', as: 'profile'
  get 'setting', to: 'session#setting', as: 'setting'
  post 'change_email', to: 'session#change_email', as: 'change_email'
  post 'change_bio', to: 'session#change_bio', as: 'change_bio'
  post 'change_password', to: 'session#change_password', as: 'change_password'
  get 'upgrade', to: 'session#upgrade', as: 'upgrade'
  get 'promote', to: 'session#promote', as: 'promote'
  post 'destroy', to: 'session#destroy', as: 'destroy'
  
  #get 'comic', to: 'session#comic', as: 'comic'
  #post 'set_comic', to: 'session#set_comic', as: 'set_comic'
  #post 'delete', to: 'session#delete', as: 'delete'
  
  resources :reviews

  
  post 'delete', to: 'session#delete', as: 'delete'
  get 'create_notification', to: 'session#create_notification', as: 'create_notification'
  post 'follow', to: 'session#follow', as: 'follow'
  post 'unfollow', to: 'session#unfollow', as: 'unfollow'
  post 'read', to: 'session#read', as: 'read'
  
  get 'comic', to: 'comics#comic', as: 'comic'
  post 'edit_comic', to: 'comics#edit_comic', as: 'edit_comic'
  get 'view_comic', to: 'comics#view_comic', as: 'view_comic'
  post 'set_comic', to: 'comics#set_comic', as: 'set_comic'
  post 'change_comic', to: 'comics#change_comic', as: 'change_comic'
  post 'delete_comic', to: 'comics#delete_comic', as: 'delete_comic'

  resources :posts do 
    resources :comments
  end
  
end

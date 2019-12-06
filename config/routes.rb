Rails.application.routes.draw do  
  root to: redirect('/homepage', status: 302)
  get 'homepage', to: 'pages#homepage', as: 'homepage'

  get 'register', to: 'register#new_user', as: 'new_user'
  post 'create', to: 'register#create', as: 'register_create' 
  post 'request', to: 'session#new_request', as: 'new_request'
  post 'promote_user', to: 'session#promote_user', as: 'promote_user'
  get 'login', to: 'session#new_session', as: 'login'
  post 'create_session', to: 'session#create', as: 'session_create'
  get 'profile', to: 'session#profile', as: 'profile'
  get 'setting', to: 'session#setting', as: 'setting'
  post 'change_email', to: 'session#change_email', as: 'change_email'
  post 'change_password', to: 'session#change_password', as: 'change_password'
  get 'upgrade', to: 'session#upgrade', as: 'upgrade'
  get 'promote', to: 'session#promote', as: 'promote'
  post 'destroy', to: 'session#destroy', as: 'destroy'
  get 'comic', to: 'session#comic', as: 'comic'
  post 'set_comic', to: 'session#set_comic', as: 'set_comic'
  post 'delete', to: 'session#delete', as: 'delete'
  
  resources :reviews

  
  
end

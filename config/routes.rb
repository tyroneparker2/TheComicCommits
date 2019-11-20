Rails.application.routes.draw do  
  root to: redirect('/register', status: 302)
  get 'register', to: 'register#new_user', as: 'new_user'
  post 'create', to: 'register#create', as: 'register_create' 
  post 'request', to: 'session#new_request', as: 'new_request'
  post 'promote_user', to: 'session#promote_user', as: 'promote_user'
  get 'login', to: 'session#new_session', as: 'login'
  post 'create_session', to: 'session#create', as: 'session_create'
  get 'profile', to: 'session#profile', as: 'profile'
  get 'upgrade', to: 'session#upgrade', as: 'upgrade'
  get 'promote', to: 'session#promote', as: 'promote'
  post 'destroy', to: 'session#destroy', as: 'destroy'
  get 'test', to: 'session#test', as: 'test'
end  
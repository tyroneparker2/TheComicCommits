Rails.application.routes.draw do
  root to: redirect('/homepage', status: 302)
  get 'homepage', to: 'pages#homepage', as: 'homepage'

  get 'comics', to: 'comics#index', as: 'comics' # index
  get 'comics/:id', to: 'comics#show', as: 'comic' # show

end

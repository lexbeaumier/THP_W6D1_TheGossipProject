Rails.application.routes.draw do
  root to: 'pages#accueil'
  #get '/accueil(/:first_name)', to 'pages#accueil'
  get '/salut(/:name)', to: 'pages#salut'
  get '/contact', to: 'pages#contact'
  get '/team', to: 'pages#team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

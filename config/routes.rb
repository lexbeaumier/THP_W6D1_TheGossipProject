Rails.application.routes.draw do

  root to: 'pages#accueil'

  get '/team', to: 'pages#team', as: 'team' 

  get '/contact', to: 'pages#contact', as: 'contact' 

  get 'welcome(/:first_name)', to: 'pages#welcome', as: 'welcome' 

  get 'potin/:id', to:'pages#potin', as: 'potin'

  get 'potin/auteur/:title', to:'pages#auteur', as: 'auteur'

  resources :gossips #, only [:new, :create]

  root to: 'utilisateurs#new'

  #get '/profil', to: 'utilisateurs#edit', as: :profil
  #patch '/profil' to: 'utilisateurs#update'

  resources :sessions, only: [:new, :create, :destroy]

  resources :utilisateurs, only: [:new, :create] do 
    member do 
      get 'confirm'
    end
  end

end

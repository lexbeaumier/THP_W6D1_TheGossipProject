class SessionsController < ApplicationController
  
  skip_before_action :only_signed_in, only: [:new, :create]
  
  def new

  end

  def create
    utilisateur_params = params.require(:utilisateur)
    @utilisateur = Utilisateur.where(username: utilisateur_params[:username]).or(Utilisateur.where(email: utilisateur_params[:username])).first
    if @utilisateur and @utilisateur.authenticate(utilisateur_params[:password])
      session[:auth] = @utilisateur.to_session
      redirect_to profil_path, success: 'Connexion réussie'
    else 
      redirect_to new_session_path, danger: 'Identifiants incorrects'
    end
  end

  def destroy
  end

end

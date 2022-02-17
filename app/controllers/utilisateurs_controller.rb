class UtilisateursController < ApplicationController

  skip_before_action :only_signed_in, only: [:new, :create, :confirm]

  def new 
    @utilisateur = Utilisateur.new
  end 

  def create 
    utilisateur_params = params.require(:utilisateur).permit(:username, :email, :password, :password_confirmation)
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.valid?
      @utilisateur.save
      UtilisateurMailer.confirm(@utilisateur).deliver_now
      redirect_to new_utilisateur_path, success: 'Votre compte a bien été créé, vous devriez recevoir un email pour confirmer votre compte'
      #render 'new'
    else 
      render 'new'
    end
  end 

  def confirm 
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.confirmation_token == params[:token]
      @utilisateur.update_attributes(confirmed: true, confirmation_token: nil)
      @utilisateur.save(validate: false)
      session[:auth] = @utilisateur.to_session
      redirect_to profil_path, success: 'Votre compte a bien été confirmé'
    else 
      redirect_to new_utilisateur_path, danger: 'Ce token ne semble pas valide'
    end 
  end

  def edit 
    @utilisateur = Utilisateur.find(session[:auth]['id'])
  end

  def update 
  end
end
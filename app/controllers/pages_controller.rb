class PagesController < ApplicationController

  #Définition de la page d'accueil
  def accueil
    puts params.inspect
    @gossips = Gossip.all
    @users = User.all
  end

  #Définition de la page Team
  def team
  end

  #Définition de la page Contact
  def contact
  end

  #Définition de la page Welcome
  def welcome
    @first_name = params[:first_name]
    puts params[:first_name].inspect
  end

  #définition de la page potin 
  def potin
    @gossips = Gossip.all
    @id = params[:id]
  end

  #définition de la page auteur 
  def auteur
  @gossips = Gossip.all
  @title = params[:title]
  end  

end
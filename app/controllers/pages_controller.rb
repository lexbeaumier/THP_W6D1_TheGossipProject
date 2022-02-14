class PagesController < ApplicationController

  def salut
    @name = params[:name]
  end

  def accueil
    @random_number = rand(1000) 
    @user = User.first
  end

  def team
  end

  def contact
  end

  
end
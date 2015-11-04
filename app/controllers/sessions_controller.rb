class SessionsController < ApplicationController
  def new
    # renderöi kirjautumissivun
    if current_user
      redirect_to info_path
    end
  end

  def create
    # haetaan usernamea vastaava käyttäjä tietokannasta
    user = User.find_by username: params[:username]

    if user && user.authenticate(params[:password])
      # talletetaan sessioon kirjautuneen käyttäjän id (jos käyttäjä on olemassa)
      session[:user_id] = user.id
      # uudelleen ohjataan käyttäjä infosivulle
      redirect_to info_path

    else

      redirect_to :back, notice: "Käyttäjätunnus tai salasana meni väärin!"
    end
  end


  def destroy
    # nollataan sessio
    session[:user_id] = nil
    # uudelleenohjataan sovellus pääsivulle
    redirect_to :root
  end
end
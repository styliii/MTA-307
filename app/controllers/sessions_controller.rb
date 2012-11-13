class SessionsController < ApplicationController
  def new
  end

  def create
    # raise params.inspect
    user = User.authenticate(params[:email])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in!"
    else
      flash.now.alert = "Invalid email. Please try again or click the Signup link below."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params([:email]))

    if user&.authentcate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

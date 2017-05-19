class UsersController < ApplicationController
  def new
    user = User.new
    user.company = params[:company]
    user.email = params[:email]
    user.password = params[:password1]

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :new
    end
  end
end

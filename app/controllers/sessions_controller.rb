class SessionsController < ApplicationController
  def new; end

  def new_signup; end

  def signin
    @user = User.where(email: params[:email]).first

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to lists_path, notice: "Signed in successfully."
    else
      flash.now.alert = "Invalid email or password!"
      render :new
    end
  end

  def signup
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to lists_path, notice: "Signed up successfully."
    else
      flash.now.alert = @user.errors.full_messages
      render :signup
    end
  end

  def signout
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully."
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end

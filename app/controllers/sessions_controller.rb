class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login successful!'
    else
      flash[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully!'
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Success, log the user in
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      # Failure, render login form with an error message
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end
end


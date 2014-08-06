class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order("email ASC")
  end

  def settings
  end

  def update_settings
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if current_user.update_attributes(user_params)
      sign_in(current_user, bypass: true)
      redirect_to user_settings_path, notice: 'Passwort geändert'
    else
      render action: 'settings'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end

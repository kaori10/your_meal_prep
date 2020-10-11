# frozen_string_literal: true

class Public::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  before_action :reject_user, only: [:create]


  def after_sign_in_path_for(resource)
    recipes_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end



  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_active
        flash[:notice] = "退会済みです。有効会員になる場合は管理者までご連絡ください。"
        redirect_to new_user_session_path
      end
    end
  end

end

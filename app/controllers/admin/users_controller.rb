class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@users = User.page(params[:page]).reverse_order
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])

  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params) ? (redirect_to admin_user_path(@user)) : (render :edit)
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :nickname, :email, :postal_code, :address, :telephone_number, :profile, :profile_image )
  end

end

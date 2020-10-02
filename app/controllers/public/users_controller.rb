class Public::UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user)
  	else
  		render "edit"
  	end
  end

  def unsubscribe
  end

  private
  def user_params
  	params.require(:user).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :nickname, :email, :postal_code, :address, :telephone_number, :profile, :profile_image )
  end
end

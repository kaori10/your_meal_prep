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

  def favorite
    @user = User.find(params[:id])
    @recipes =@user.recipes
    favorites = Favorite.where(user_id: current_user.id).pluck(:recipe_id)
    # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = Recipe.find(favorites)
    # recipesテーブルから、お気に入り登録済みのレコードを取得
  end

  def unsubscribe
  end

  private
  def user_params
  	params.require(:user).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :nickname, :email, :postal_code, :address, :telephone_number, :profile, :profile_image )
  end
end

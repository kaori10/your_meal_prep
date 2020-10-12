class Admin::RecipesController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@recipes = Recipe.all.page(params[:page]).reverse_order
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  private
  def recipe_params
  	params.require(:recipe).permit(:title, :ingredient, :body, :image)
  end

end

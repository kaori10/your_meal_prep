class Admin::RecipesController < ApplicationController
  def index
  	@recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  private
  def recipe_params
  	params.require(:recipe).permit(:title, :ingredient, :body, :image)
  end

end

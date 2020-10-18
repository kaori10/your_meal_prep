class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@recipe = Recipe.find(params[:recipe_id])
  	@reviews = @recipe.reviews
  end

  private
  def review_params
  	params.require(:review).permit(:recipe_id, :score, :content)
  end

end

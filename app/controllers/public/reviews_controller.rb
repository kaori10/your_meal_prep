class Public::ReviewsController < ApplicationController

  def index
  	@recipe = Recipe.find(params[:recipe_id])
  	@reviews = @recipe.reviews

  end

  def create
  	@review = Review.new(review_params)
  	@review.user_id = current_user.id
  	if @review.save
  		redirect_to recipe_reviews_path(@review.recipe)
  	else
  		@recipe = Recipe.find(params[:id])
  		render "public/recipes/show"
  	end
  end

  private
  def review_params
  	params.require(:review).permit(:recipe_id, :score, :content)
  end

end

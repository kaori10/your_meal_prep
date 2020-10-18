class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@recipe = Recipe.find(params[:recipe_id])
  	@reviews = @recipe.reviews

  end

  def create
  	@review = Review.new(review_params)
  	@review.user_id = current_user.id
    @review.point = Language.get_data(review_params[:content]) #APIに受け渡す
  	if @review.save
  		redirect_to recipe_reviews_path(@review.recipe)
  	else
      @recipe = Recipe.find(params[:recipe_id])
  		render "public/recipes/show"
  	end
  end

  private
  def review_params
  	params.require(:review).permit(:recipe_id, :score, :content)
  end

end

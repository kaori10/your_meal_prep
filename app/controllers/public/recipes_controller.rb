class Public::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
    @review = Review.new
  end

  def edit
  	@recipe = Recipe.find(params[:id])
    @genres = Genre.all
  end

  def update
  	@recipe = Recipe.find(params[:id])
    @genres = Genre.all
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  def new
  	@recipe = Recipe.new
    @genres = Genre.all
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	@recipe.user_id = current_user.id
    @genres = Genre.all
  	if @recipe.save
    	redirect_to recipes_path
    else
      render "new"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
  	params.require(:recipe).permit(:title, :ingredient, :body, :image, genre_ids: [])
  end

end

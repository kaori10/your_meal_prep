class Public::RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
    @review = Review.new
  end

  def edit
  	@recipe = Recipe.find(params[:id])
    @genres = Genre.all
    if @recipe.user != current_user
      redirect_to recipes_path, alert: "不正なアクセスです。"
    end
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

  def genre
    @genre = Genre.find(params[:id])
    @recipes = @genre.recipes.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  private
  def recipe_params
  	params.require(:recipe).permit(:title, :ingredient, :body, :image, genre_ids: [])
  end

end

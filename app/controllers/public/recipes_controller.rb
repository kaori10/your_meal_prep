class Public::RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @genres = Genre.only_active
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      all_recipes = @genre.recipes
    else
      all_recipes = Recipe.where_genre_active.includes(:genre)
    end
    @recipes = Recipe.page(params[:page]).reverse_order
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
    @genres = Genre.only_active
    if params[:id]
      @genre = @genres.find(params[:id])
      all_recipes = @genre.recipes
    else
      all_recipes = Recipe.where_genre_active.includes(:genre)
    end
    @recipes = Recipe.page(params[:page]).reverse_order
  end

  private
  def recipe_params
  	params.require(:recipe).permit(:title, :ingredient, :body, :image, genre_ids: [])
  end

end

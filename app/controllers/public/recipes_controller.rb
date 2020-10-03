class Public::RecipesController < ApplicationController

  def index
  	@recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def edit
  	@recipe = Recipe.find(params[:id])
  end

  def update
  	@recipe = Recipe.find(params[:id])
    @recipe.update
    redirect_to receipe_path(@recipe)
      # if @recipe.update(recipe_params)
      #    recipe_params[:genre_ids].each do | recipeg |
      #       genres = @recipe.genres.pluck(:genre_id)
      #       unless genres.include?(recipe.to_i)
      #         genre = RecipeGenre.new(genre_id: recipeg)
      #         genre.recipe_id = @recipe.id
      #         genre.save
      #       end
      #     end
      #       redirect_to admin_recipes_path
      # else
      #    render 'edit'
      # end
  end

  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	@recipe.user_id = current_user.id
  	@recipe.save
  	redirect_to recipe_path(@recipe)
  end

  private
  def recipe_params
  	params.require(:recipe).permit(:title, :ingredient, :body, :image, genre_ids: [])
  end

end

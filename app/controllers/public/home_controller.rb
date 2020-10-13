class Public::HomeController < ApplicationController

  def top
  	@all_ranks = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end

  def about
  end

end

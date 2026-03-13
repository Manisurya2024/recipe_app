class RecipesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authorize_recipe_owner, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Recipe created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe deleted successfully."
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def authorize_recipe_owner
    redirect_to recipes_path, alert: "Not authorized." unless @recipe.user == current_user
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients, :instructions, :category_id)
  end
end
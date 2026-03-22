class RecipesController < ApplicationController
 before_action :require_login, except: [:index, :show], unless: -> { request.format.json? }
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authorize_recipe_owner, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.all

  respond_to do |format|
    format.html   # for browser UI
    format.json { render json: @recipes }
  end
  end
  

  def show
      @recipe = Recipe.find(params[:id])

  respond_to do |format|
    format.html
    format.json { render json: @recipe }
  end
  end

  def new
    @recipe = Recipe.new
  end

  def create
  @recipe = Recipe.new(recipe_params)

  # assign user only if logged in
  @recipe.user = current_user if current_user

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
  params.require(:recipe).permit(:title, :description, :ingredients, :instructions)
end
end
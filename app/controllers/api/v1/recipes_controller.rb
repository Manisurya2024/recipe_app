class Api::V1::RecipesController < ApplicationController

  # GET /api/v1/recipes
  def index
    recipes = Recipe.all
    render json: recipes
  end

  # GET /api/v1/recipes/:id
  def show
    recipe = Recipe.find(params[:id])
    render json: recipe
  end

  # POST /api/v1/recipes
  def create
    recipe = Recipe.new(recipe_params)

    if recipe.save
      render json: recipe, status: :created
    else
      render json: recipe.errors, status: :unprocessable_entity
    end
  end

  # UPDATE
  def update
    recipe = Recipe.find(params[:id])

    if recipe.update(recipe_params)
      render json: recipe
    else
      render json: recipe.errors
    end
  end

  # DELETE
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: { message: "Deleted successfully" }
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients, :instructions, :user_id, :category_id)
  end

end
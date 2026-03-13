class CommentsController < ApplicationController
  before_action :require_login

  def create
    @recipe = Recipe.find(params[:recipe_id])

    @comment = @recipe.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipe_path(@recipe)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    recipe = @comment.recipe

    @comment.destroy

    redirect_to recipe_path(recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
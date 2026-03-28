class CommentsController < ApplicationController
  before_action :require_login

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @recipe, notice: "Comment added!"
    else
      redirect_to @recipe, alert: "Failed to add comment."
    end
  end

  def destroy
  @recipe = Recipe.find(params[:recipe_id])
  @comment = @recipe.comments.find(params[:id])

  if @comment.user == current_user
    @comment.destroy
    redirect_to @recipe, notice: "Comment deleted!"
  else
    redirect_to @recipe, alert: "Not authorized!"
  end
end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
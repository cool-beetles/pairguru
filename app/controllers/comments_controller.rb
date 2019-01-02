class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = current_user.comments.create(comment_params)
    @comment.movie_id = params[:movie_id]

    @comment.save
    redirect_to movie_path(@comment.movie_id)
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy

    redirect_to movie_path(comment.movie_id)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end

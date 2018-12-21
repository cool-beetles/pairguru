class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @comments = Comment.movie.all	
  end

  def new
  	@comment = Comment.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to movie_path 
    else
      render :new
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body, :post_id, user_attributes: [:name, :email])
  end
  end
end

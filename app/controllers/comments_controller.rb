class CommentsController < ApplicationController
  before_action :set_movie
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @movie.comments
  end

  def show
  end

  def new
    @comment = @movie.comments.new
    render "form"
  end

  def edit
    render "form"
  end

  def create
    @comment = @movie.comments.new(comment_params)
    @comment.username = current_user.first_name + " " + current_user.last_name
    if @comment.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def update
    puts "Attempting to update on #{comment_params}... look at this!"
    if @comment.update(comment_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to movie_path(@movie)
  end

  private
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :username)
    end
end
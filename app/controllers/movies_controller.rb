class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :like, :dislike]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit

  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def like
    if @movie.like.nil?
      @movie.like = 1
    else
      @movie.like += 1
    end
    @movie.save
    redirect_to movie_path(@movie)
  end

  def dislike
    if @movie.dislike.nil?
      @movie.dislike = 1
    else
      @movie.dislike += 1
    end
    @movie.save
    redirect_to movie_path(@movie)
  end



  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :duration, :genre, :description, :trailer, :like, :dislike)
    end
end

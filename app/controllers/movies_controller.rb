class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = TmdbService.new.search_movies(params[:search])["results"]
    else
      @movies = TmdbService.new.get_movies["results"]
    end
  end

  def show
    @movie = TmdbService.new.movie_info(params[:movie_id])
  end

  private

  def movie_params
    params.require(:tv_show).permit(:search, :movie_id)
  end
end

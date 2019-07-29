class TvShowsController < ApplicationController
  def index
    if params[:search]
      @shows = TmdbService.new.search_tv_shows(params[:search])["results"]
    else
      @shows = TmdbService.new.get_tv_shows["results"]
    end
  end

  def show
    @show = TmdbService.new.show_info(params[:show_id])
  end

  private

  def show_params
    params.require(:tv_show).permit(:search, :show_id)
  end
end

require 'httparty'
require 'json'

class TmdbService
  include HTTParty
  base_uri 'https://api.themoviedb.org/3'

  def get_tv_shows
    response = self.class.get('/discover/tv?api_key='+ Rails.application.credentials.tmdb[:api_key] + '&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false')
    JSON.parse(response.body)
  end

  def search_tv_shows(search)
    response = self.class.get('/search/tv?api_key='+ Rails.application.credentials.tmdb[:api_key] + '&query='+search)
    JSON.parse(response.body)
  end

  def show_info(show_id)
    response = self.class.get('/tv/'+show_id.to_s+'?api_key='+ Rails.application.credentials.tmdb[:api_key])
    JSON.parse(response.body)
  end

  def get_movies
    response = self.class.get('/movie/popular?api_key='+ Rails.application.credentials.tmdb[:api_key] + '&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false')
    JSON.parse(response.body)
  end

  def search_movies(search)
    response = self.class.get('/search/movie?api_key='+ Rails.application.credentials.tmdb[:api_key] + '&query='+search)
    JSON.parse(response.body)
  end

  def movie_info(movie_id)
    response = self.class.get('/movie/'+movie_id.to_s+'?api_key='+ Rails.application.credentials.tmdb[:api_key])
    JSON.parse(response.body)
  end
end

Rails.application.routes.draw do
  root 'tv_shows#index'

  get 'tv_shows/show' => 'tv_shows#show'

  get 'movies/' => 'movies#index'

  get 'movies/show' => 'movies#show'
end

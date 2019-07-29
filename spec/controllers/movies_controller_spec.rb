require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie) { TmdbService.new.movie_info(399579) }

  describe "GET index" do
    it "returns HTTP success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns HTTP success" do
      get :show, params: {movie_id: movie["id"]}
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, params: {movie_id: movie["id"]}
      expect(response).to render_template(:show)
    end

    it "assigns movie to @movie" do
      get :show, params: {movie_id: movie["id"]}
      expect(assigns(:movie)).to eq(movie)
    end
  end
end

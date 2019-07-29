require 'rails_helper'

RSpec.describe TvShowsController, type: :controller do
  let(:show) { TmdbService.new.show_info(1412) }

  describe "GET index" do
    it "returns HTTP success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns HTTP success" do
      get :show, params: {show_id: show["id"]}
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, params: {show_id: show["id"]}
      expect(response).to render_template(:show)
    end

    it "assigns show to @show" do
      get :show, params: {show_id: show["id"]}
      expect(assigns(:show)).to eq(show)
    end
  end
end

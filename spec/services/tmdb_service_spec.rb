require 'rails_helper'

RSpec.describe TmdbService, type: :service do
  describe "get_tv_shows" do
    it "returns a hash containing popular tv shows" do
      result = TmdbService.new.get_tv_shows
      expect(result).to be_a(Hash)
    end
  end

  describe "search_tv_shows" do
    it "returns a hash containing tv shows based on a search query string" do
      result = TmdbService.new.search_tv_shows("The Office")
      expect(result).to be_a(Hash)
    end
  end

  describe "show_info" do
    it "returns a hash containing a tv show based on it's the value of it's id" do
      result = TmdbService.new.show_info(1412)
      expect(result).to be_a(Hash)
      expect(result["name"]).to eq("Arrow")
    end
  end

  describe "get_movies" do
    it "returns a hash containing popular movies" do
      result = TmdbService.new.get_movies
      expect(result).to be_a(Hash)
    end
  end

  describe "search_movies" do
    it "returns a hash containing tv shows based on a search query string" do
      result = TmdbService.new.search_movies("John Wick")
      expect(result).to be_a(Hash)
    end
  end

  describe "movie_info" do
    it "returns a hash containing a tv show based on it's the value of it's id" do
      result = TmdbService.new.movie_info(245891)
      expect(result).to be_a(Hash)
      expect(result["title"]).to eq("John Wick")
    end
  end
end

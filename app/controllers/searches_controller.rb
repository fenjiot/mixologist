class SearchesController < ApplicationController
  def index
    @results = Search.new(params[:search]).results
  end
end

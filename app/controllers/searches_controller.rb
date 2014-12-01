class SearchesController < ApplicationController
  def index
    @results = Search.new(query).results
    @query = query
  end

  private

  def query
    params[:search]
  end
end

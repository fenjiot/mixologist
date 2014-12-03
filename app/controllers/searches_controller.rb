class SearchesController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @results = Search.new(query).results
  end

  private

  def query
    params[:search]
  end
end

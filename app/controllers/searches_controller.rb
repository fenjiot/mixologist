class SearchesController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    raw_results = Search.new(query).results
    @results = processed_results(raw_results)
  end

  private

  def processed_results(raw_results)
    results = []
    grouped_results = raw_results.group_by(&:class)
    grouped_results.each do |key, group|
      group.each do |item|
        results << item
      end
    end
    results
  end

  def query
    params[:search]
  end
end
